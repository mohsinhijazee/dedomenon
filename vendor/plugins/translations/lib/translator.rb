class Translator < ActiveRecord::Base
  establish_connection(
    RAILS_ENV+"-translations"
  )

  has_many :translator2languages

  def self.reloadable?; false end

end
