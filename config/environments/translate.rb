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

#Dependencies.mechanism                             = :require
config.cache_classes     = false
#ActionController::Base.consider_all_requests_local = true
#ActionController::Base.perform_caching             = true
config.action_controller.consider_all_requests_local = true
config.action_controller.perform_caching             = false
#BREAKPOINT_SERVER_PORT = 42531
# Enable the breakpoint server that script/breakpointer connects to
#config.breakpoint_server = false

class MadbSettings
  #per environment: self.list_length
  def self.list_length
    30
  end
  
  def self.s3_local_dir
    "/tmp/madb_devel/"
  end
  def self.s3_bucket_name
    "madb_devel"
  end
end
class TranslationsConfig

    def self.create_inexisting_translations
      #if set to true, create entries for inexisting translations, and updates hints with urls on where the term was used.
      #should be set to false in production environments
      true
    end
end
