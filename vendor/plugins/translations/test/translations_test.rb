require 'test/unit'
require 'test_helper'
require File.dirname(__FILE__) + '/../lib/translations'
require File.dirname(__FILE__) + '/../lib/translation'
fixtures = []
fixtures_tables = %w{languages translations translators_hints}
fixtures_tables.each do |table_name|
  fixtures.push  Fixtures.new(Translation.connection,table_name, File.dirname(__FILE__) + "/fixtures/#{table_name}")
end
  fixtures.reverse.each { |fixture| fixture.delete_existing_fixtures }
  fixtures.each { |fixture| fixture.insert_fixtures }

class TranslationsTest < Test::Unit::TestCase
  include Translations
  attr_accessor :cookies, :request

  def setup
    @request    = ActionController::TestRequest.new
    @http_accept_language = { 
        :en_fr_nl => "en-gb,fr;q=0.8,nl;q=0.5",
        :fr_nl_en => "fr-fr,en;q=0.8,nl;q=0.9",
        :es_fr_nl => "es-es,nl;q=0.7,fr;q=0.8",
        :es_nl_fr => "es-es,nl;q=0.8,fr;q=0.7",
    }
    reset_cookies
  end

  def reset_cookies
    @cookies = {}
  end

  def test_user_lang_detection
    #ordered languages
    reset_cookies
    @request.env["HTTP_ACCEPT_LANGUAGE"] = @http_accept_language[:fr_nl_en]
    assert_equal "fr", user_lang
    assert_equal "fr", cookies[TranslationsConfig.cookie_name]

    #one unused lang, other langs not ordered by weight
    reset_cookies
    @request.env["HTTP_ACCEPT_LANGUAGE"] = @http_accept_language[:es_fr_nl]
    assert_equal "fr", user_lang
    assert_equal "fr", cookies[TranslationsConfig.cookie_name]

    #one unused lang, other langs ordered by weight
    reset_cookies
    @request.env["HTTP_ACCEPT_LANGUAGE"] = @http_accept_language[:es_nl_fr]
    assert_equal "nl", user_lang
    assert_equal "nl", cookies[TranslationsConfig.cookie_name]


    #priority given to cookie over http headers
    reset_cookies
    cookies[TranslationsConfig.cookie_name] = "fr"
    @request.env["HTTP_ACCEPT_LANGUAGE"] = @http_accept_language[:es_nl_fr]
    assert_equal "fr", user_lang
    assert_equal "fr", cookies[TranslationsConfig.cookie_name]

  end
  def test_simple_translation_with_language_selection
    
    #take language from HTTP headers
    #-------------------------------
    reset_cookies
    @request.env["HTTP_ACCEPT_LANGUAGE"] = @http_accept_language[:fr_nl_en]
    assert_equal "oui", t("yes")
    assert_equal "fr", cookies[TranslationsConfig.cookie_name]

    #one inexisting language, and unordered weighted languages
    reset_cookies
    @request.env["HTTP_ACCEPT_LANGUAGE"] = @http_accept_language[:es_fr_nl]
    assert_equal "oui", t("yes")
    assert_equal "fr", cookies[TranslationsConfig.cookie_name]

    #one inexisting language, and unordered weighted languages
    reset_cookies
    @request.env["HTTP_ACCEPT_LANGUAGE"] = @http_accept_language[:es_nl_fr]
    assert_equal "ja", t("yes")
    assert_equal "nl", cookies[TranslationsConfig.cookie_name]
    assert_equal "nl", user_lang
    
    #explicit language choice, we don't change the cookie
    #----------------------------------------------------
    reset_cookies
    cookies[TranslationsConfig.cookie_name] = "test_value"
    assert_equal "oui", t("yes", { :lang => "fr"})
    assert_equal "test_value", cookies[TranslationsConfig.cookie_name]
    assert_equal "ja", t("yes", { :lang => "nl"})
    assert_equal "test_value", cookies[TranslationsConfig.cookie_name]
    assert_equal "yes", t("yes", { :lang => "en"})
    assert_equal "test_value", cookies[TranslationsConfig.cookie_name]

    #language from cookies
    #---------------------
    cookies[TranslationsConfig.cookie_name] = "fr"
    assert_equal "oui", t("yes")
    assert_equal "fr", cookies[TranslationsConfig.cookie_name] 
    cookies[TranslationsConfig.cookie_name] = "nl"
    assert_equal "ja", t("yes")
    assert_equal "nl", cookies[TranslationsConfig.cookie_name] 
    cookies[TranslationsConfig.cookie_name] = "en"
    assert_equal "yes", t("yes")
    assert_equal "en", cookies[TranslationsConfig.cookie_name] 
  end

  #check we insert the inexisting translations with their correct initial value
  #
  def test_inexisting_translation_creation
    reset_cookies
    
    #initialise counters
    pre_translations_count = Translation.count
    pre_hints_count = TranslatorsHint.count
    @request.env["HTTP_ACCEPT_LANGUAGE"] = @http_accept_language[:fr_nl_en]
    @request.request_uri = "/my_controller/my_action/45?test=true"

    #check we return the translation id for an inexisting translation
    assert_equal "my_brand_new_translation", t("my_brand_new_translation")

    #new counters
    post_translations_count = Translation.count
    post_hints_count = TranslatorsHint.count

    #we inserted one translation
    assert_equal 1, post_translations_count-pre_translations_count
    #the translation inserted is correct
    inserted_translation = Translation.find(:first, :order => "id desc")
    assert_equal "fr", inserted_translation.lang
    assert_equal "my_brand_new_translation", inserted_translation.t_id
    assert_equal "my_brand_new_translation", inserted_translation.value
    assert_equal "system", inserted_translation.scope

    #we inserted one hint
    assert_equal 1 , post_hints_count-pre_hints_count

    hint = TranslatorsHint.find(:first, :order => "id desc")
    assert_equal "my_brand_new_translation", hint.t_id
    assert_equal @request.request_uri, hint.urls[0]
    assert_equal 1, hint.urls.length

    #request the same translation
    
    #ireinitialise counters
    pre_translations_count = Translation.count
    pre_hints_count = TranslatorsHint.count
    @request.request_uri = "/my_second_controller/my_second_action/46?test=true"

    #check we return the translation id for an inexisting translation
    assert_equal "my_brand_new_translation", t("my_brand_new_translation")

    #new counters
    post_translations_count = Translation.count
    post_hints_count = TranslatorsHint.count

    #we inserted no new translation
    assert_equal 0, post_translations_count-pre_translations_count
    #
    #we inserted no hint
    assert_equal 0 , post_hints_count-pre_hints_count

    #but we updated the hint's urls
    hint = TranslatorsHint.find(:first, :order => "id desc")
    assert_equal "my_brand_new_translation", hint.t_id
    assert_equal @request.request_uri, hint.urls[1]
    assert_equal 2, hint.urls.length

  end



  def test_translations_with_parameters

    cookies[TranslationsConfig.cookie_name] = "fr"
    assert_equal "je bois du vin rouge", t("i_drink_wine_with_color", { :vars => { 'color' => t("red_wine_color")}})
    cookies[TranslationsConfig.cookie_name] = "nl"
    assert_equal "ik drink rode wijn", t("i_drink_wine_with_color", { :vars => { 'color' => t("red_wine_color")}})
    cookies[TranslationsConfig.cookie_name] = "en"
    assert_equal "I drink red wine", t("i_drink_wine_with_color", { :vars => { 'color' => t("red_wine_color")}})

  end

  # how can I test the right name is used for the cookie?
  #def test_cookie_name
  #  class TranslationsConfig
  #    def self.cookie_name
  #      "test_cookie_name"
  #    end
  #  end
  #  reset_cookies
  #  @request.env["HTTP_ACCEPT_LANGUAGE"] = @http_accept_language[:fr_nl_en]
  #  assert_equal "fr", user_lang
  #  assert_equal "fr", cookies["test_cookie_name"]
  #end
end
