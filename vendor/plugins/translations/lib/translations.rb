

module Translations
	def t(s, options={})
  #options can be:
  # * :vars : variables that can be used in the translation, eg the username
  # * :notes: notes to be passed to the translators
  # * :scope: The scope from which we start searching the translation
  # * :lang : the language to display is passed as option, else we look for it as usual (cookie, http prefered languages)
    
    #ugly hook written in the middle of the night
    #This sets the variable request in case it isn't defined
    #TODO: check this code
    return "" if s.nil?
    if RAILS_ENV=="translate"
      begin
        if request
        end
      rescue
        #needed in translate environment to create translator hints
        #but caused problem on admin/entities in production
        #breakpoint "EXCEPTION"
        request = nil
      end
    end
    lang = options[:lang] || user_lang
    return s if lang=="t_id" or (RAILS_ENV=="test" and ENV["TRANSLATIONS_ENV"]!="test")
    
    #Don't iterate on scopes if translation doesn't exist....
    translations_scopes = Translation.find_by_sql("select distinct scope from translations where t_id='#{Translation.connection.quote_string(s)}'").collect{|r| r.scope}
    if translations_scopes.length==0
      #in this case we have found no translation in any scope for t_id
      if TranslationsConfig.create_inexisting_translations and (options[:scope]=="system" or options[:scope].nil?)
        create_inexisting_translation(s,lang,options)
      end
      return "!"+s+"!" if RAILS_ENV == "translate" and options[:scope]=="system"
      return s
    end
    
    ## update scopes with id_filters values
    @scopes = []
    TranslationsConfig.scopes.each do |scope|
      next if !translations_scopes.include? scope[:scope_name]
      filter_value = self.send scope[:id_filter] if scope[:id_filter]
      @scopes.push({ :scope_name => scope[:scope_name], :id_filter => filter_value }) 
    end
    
    TScope.each_filter(@scopes) do |filter|
 
      translation = Translation.find :first, :conditions => [ "#{filter[0]} and t_id= ? and lang= ? "].concat(filter[1..filter.length].push(s).push(lang)) 

      if translation
          if TranslationsConfig.create_inexisting_translations and request and translation.scope =="system"
            hint = TranslatorsHint.find(:first, :conditions => ["t_id=?", s])
            if (!request.nil?) and hint and !hint.urls.include? request.request_uri
              hint.urls.push request.request_uri
              hint.save
            end
          end
          
          template = Liquid::Template.parse(translation.value)
          value = s
          begin
            value =  template.render(options[:vars])
          rescue Exception => exception
            #error when rendering template....
            SystemNotifier.deliver_translation_problem_notification(self, request, exception, { :t_identification => s, :lang => lang, :options => options} )
          end
          return "+"+value+"+"if RAILS_ENV=="translate" and value!=s
          return "!"+value+"!"if RAILS_ENV=="translate" and value==s
          return value
      end
    end

    if TranslationsConfig.create_inexisting_translations and request and (options[:scope]=="system" or options[:scope].nil?)
      create_inexisting_translation(s,lang,options)
    end

    if RAILS_ENV=="translate"
      return %Q{!#{s}!}
    else
      return s
    end
	end

  # This method is used to return the JSON represenation
  # Simply addes qoutes if its string leave it as it is otherwise.
  def j(value)
    value.class == String ? '"' + value + '"' : value.to_s
  end

  def user_lang
    #uncomment to work in the console
    #return 'fr' if RAILS_ENV=='development'


    return cookies[TranslationsConfig.cookie_name] if cookies and cookies[TranslationsConfig.cookie_name]

    accepted_langs = request.env["HTTP_ACCEPT_LANGUAGE"]||"en"
    accepted_langs = accepted_langs.split(",")
    prefered_langs = []
    accepted_langs.each do  |l|
      parts = l.split(";")
      parts.length==1 ? weight=1 : weight = parts[1][2..-1]
      prefered_langs.push({ :complete => parts[0], :short => parts[0][0..1], :weight => weight})
    end

    #reverse sort so the prefered language is the first element of the array
    prefered_langs.sort!{|a,b| b[:weight].to_f<=>a[:weight].to_f}
    languages = Language.find(:all).collect{|l| l.lang }

    prefered_lang = nil
    prefered_langs.each do |l|
      if languages.include? l[:complete] 
        prefered_lang = l[:complete]
        break
      elsif languages.include? l[:short]
        prefered_lang = l[:short]
        break
      end
    end

    if prefered_lang.nil?
      cookies[TranslationsConfig.cookie_name]="en"
      return "en"
    else
      cookies[TranslationsConfig.cookie_name]=prefered_lang
      return prefered_lang
    end

    return cookies[TranslationsConfig.cookie_name]

  end
  
  def create_inexisting_translation(s,lang,options)
        translations_notes = ""
        translations_notes += options[:notes] if options[:notes]
        if options[:vars]
          translations_notes += "\n With translation parameters:\n" 
          options[:vars].each_pair do |k,v|
              translations_notes+=k.to_s + ", "
          end
        end
    
        t = Translation.new(:t_id => s, :lang => lang, :value => s, :scope => options[:scope] ? options[:scope] : "system" ).save

        if hint = TranslatorsHint.find(:first, :conditions => ["t_id=?",s])
          #add current url if it's not in the hint already
          if !hint.urls.include? request.request_uri
            hint.urls.push request.request_uri
            hint.save
          end
        else
          #create new hint if we have the request set
          TranslatorsHint.new(:t_id=> s, :notes => translations_notes, :urls => [request.request_uri]).save if request
        end
  end
end
class TScope

  def self.each_sql(scopes)
    scopes.each do |scope|
      sql= "scope='#{scope[:scope_name]}'"
      sql+=" and id_filter = '#{scope[:id_filter]}'" if scope[:id_filter]
    end
  end

  #Returns all scopes following the one passed as argument
  def self.each_filter(scopes, scope_name =nil)
    to_be_returned = scope_name.nil? ? true : false
    scopes.each do |scope|
      if ! to_be_returned
        if scope[:scope_name]!=scope_name
          next
        else
          to_be_returned = true
        end
      end
      if scope[:id_filter]
        yield [ "scope = ? and id_filter=?", scope[:scope_name], scope[:id_filter]]
      else
        yield [ "scope = ?", scope[:scope_name]]
      end
    end
  end


end

