class Translation < ActiveRecord::Base
  
  #You can set a database containing translations per environment.
  # Just define them as development-translations in config/database.yml
  establish_connection(
    RAILS_ENV+"-translations"
  )


  def self.reloadable?; false end
end
