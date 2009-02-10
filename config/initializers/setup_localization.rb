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

require 'translations'
class ActionMailer::Base
	include Translations
  helper_method :t
end

class TranslationsConfig
    @@scopes = [] # [ { :scope_name => "database", :id_filter => proc_returning_current_db_id }, {:scope_name => "account", :id_filter => proc_returning_account_id}, {:scope_name => "system", :id_filter => nil} ]
    @@scopes = [ {:scope_name => "system", :id_filter => nil} ]
    @@scopes = [ {:scope_name => "system", :id_filter => nil} ,
                 {:scope_name => "account", :id_filter => :get_account_id},
                 {:scope_name => "database", :id_filter => :get_database_id},
    ]

    def self.scopes
      @@scopes
    end


    # Only the cookie name is being used.
    def self.cookie_name
      :user_language
    end

    def self.default_locale
      :en
    end

    def self.languages
      load_files = Dir["#{RAILS_ROOT}/config/locales/*.yml"]
      languages = load_files.collect {|file| File.basename(file).chomp '.yml'}
      return languages
    end
end

  I18n.default_locale = TranslationsConfig.default_locale
  I18n.locale = TranslationsConfig.default_locale
