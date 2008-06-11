################################################################################
#This file is part of Dedomenon.
#
#Dedomenon is free software: you can redistribute it and/or modify
#it under the terms of the GNU Affero General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#Dedomenon is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU Affero General Public License for more details.
#
#You should have received a copy of the GNU Affero General Public License
#along with Dedomenon.  If not, see <http://www.gnu.org/licenses/>.
#
#Copyright 2008 Raphaël Bauduin
################################################################################

class Admin::TranslationsController < ApplicationController
  before_filter :login_required
  before_filter :check_user_rights
  before_filter :set_return_url , :only => ["list", "index"]
  layout :determine_layout

  def determine_layout
      #no layout if
      # -action=related_entities_list and not popup
      # -action=list_availaible_for_link or entities_list
      # -xhr request
      # -embedded!=nil
      # -displayed as component (=> embedded == true)
		# removed or (["list_available_for_link", "entities_list"].include? params["action"])

    if ( %w(translations_list).include? params["action"] and params["popup"].nil?)  or (request.xml_http_request?) or (! params["embedded"].nil?) or (embedded?)
      return nil
    elsif params["popup"]=='t' and (!request.xml_http_request?)
      return "popup"
    else
      return "application"
    end
  end


  def check_user_rights
#    redirect_to :controller => "/authentication", :action => "logout" if session["user"].login!="translator"
    #
    #
    @translator = Translator.find_by_login session["user"]["login"]
    
    #FIXME: Add this token to the translations database.
    
    begin
      flash['notice'] = "user_not_translator"  
      redirect_to :back
    end if @translator == nil
    
    
    
    session[:translation_scope]||="system"
  end
  
  def index
    list
    render_action 'list'
  end

  def list
    @inexisting_translations = Translation.find_by_sql("select distinct t_id from translations where t_id not in (select t_id from translations where #{language_filter}) or ((t_id=value or value='')  and #{language_filter})")
  end

  def translations_list
    additional_filter=""
    searched_value =  params["value_filter"]
    if params["value_filter"]
      words = params["value_filter"].split(" ")
      if words[0].downcase=="untranslated"
        additional_filter = "and value=t_id"
        searched_value =  words[1..-1]
      end
    end

    additional_filter+= "and " + language_filter

    @translation_pages, @translations = paginate :translation, :per_page => 10, :conditions => [ "(t_id like ? or value like ? and scope=?) #{additional_filter}", "%#{searched_value}%", "%#{params["value_filter"]}%", session[:translation_scope]], :order => "t_id, lang"
    @hidden_fields = [ "id", "id_filter"]

  end

  def show
    @translation = Translation.find(params[:id])
  end

  def new
    session["return-to"] = request.env["HTTP_REFERER"]
    if Translation.count(:conditions => "t_id='#{params["id"]}' and scope='#{session[:translation_scope]}'")>0
      redirect_to :action => "edit", :id => params["id"], :scope => session[:translation_scope]  and return
    else
      @translation = Translation.new
      @languages = Language.find :all
    end
  end

  def create
    exit if params[:translation]["value"]=="" or params[:translation]["value"].nil?
    @translation = Translation.new(params[:translation])
    if @translation.save
      flash['notice'] = 'Translation was successfully created.'
      redirect_to :action => 'list'
    else
      render_action 'new'
    end
  end

  def edit
    @translations = Translation.find :all, :conditions => [ " t_id = ? and scope = ?" , params[:id], params[:scope] ]
    @hint = TranslatorsHint.find( :first, :conditions => [ "t_id = ?" , params[:id]])
    @languages = Language.find :all, :conditions => language_filter
#    @languages = Language.find :all


  end

  def update_one
      @translation = Translation.find(params[:id])
      @translation.value = params["value"]
      if !@translation.save
      end
      render :text => @translation.value
  end

  def update
    if params[:id]
      @translation = Translation.find(params[:id])
    else
      exit if params[:translation]["value"]=="" or params[:translation]["value"].nil?
      @translation = Translation.new
    end
    begin
    if @translation.update_attributes(params[:translation])
        render :text => 'Translation was successfully updated.'
      #redirect_to :action => 'show', :id => @translation
    else
      render :text =>  'Translation was NOT successfully updated.'
    end
    rescue ActiveRecord::StatementInvalid => e
      render :text => "Update was not possible! Are you sure you don't try to add an already existing translation?"
    rescue Exception => e
      render :text => e.to_s
    end
  end

  def destroy
    if params["t_id"] and params["t_id"]!=""
      t_id = params["t_id"]
    elsif params[:id]
      t_id = Translation.find(params[:id]).t_id
    else
      raise StandardError.new("incorrecpt parameters passed to translations#destroy")
    end
    Translation.delete_all("t_id = '#{t_id}'")
    TranslatorsHint.delete_all("t_id = '#{t_id}'")
    redirect_to :action => 'list'
  end

  def check_usage_in_source_code
    lines = ""
    Open3.popen3(%Q{rgrep -w #{params["id"]} #{RAILS_ROOT}/app}) { |stdin, stdout, stderr|
      lines = stdout.readlines.join("<br />")
    }
    render :text => lines

  end

  private
  def language_filter

    #translator = Translator.find_by_login(session["user"]["login"])
    translator_languages = @translator.translator2languages.collect{|cl| cl.language.lang}
    languages_filter = "(" + translator_languages.collect{|l| "'"+l+"'"}.join(",")+")"

    "lang in " + languages_filter
  end
end
