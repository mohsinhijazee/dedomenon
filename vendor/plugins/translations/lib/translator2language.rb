class Translator2language < ActiveRecord::Base
  establish_connection(
    RAILS_ENV+"-translations"
  )

  belongs_to :language
  belongs_to :user
  def self.reloadable?; false end

  def self.table_name
    "translator2language"
  end
end
