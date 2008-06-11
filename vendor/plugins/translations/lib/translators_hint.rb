class TranslatorsHint < ActiveRecord::Base
  serialize :urls

  establish_connection(
    RAILS_ENV+"-translations"
  )

  #You can set a database containing translations per environment.
  # Just define them as development-translations in config/database.yml
#  ActiveRecord::Base.establish_connection(
#    RAILS_ENV+"-translations"
#  )

  def self.reloadable?; false end
end
