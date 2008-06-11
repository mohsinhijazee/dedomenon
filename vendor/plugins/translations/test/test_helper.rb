ENV["RAILS_ENV"] = "test"
ENV["TRANSLATIONS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../../../../config/environment")
require 'test_help'

#adapt some sessings from test_help.rb
Test::Unit::TestCase.fixture_path = File.expand_path(File.dirname(__FILE__) + "/fixtures/")
def create_fixtures(*table_names)
    Fixtures.create_fixtures(Test::Unit::TestCase.fixture_path, table_names)
end


class Test::Unit::TestCase
  # Turn off transactional fixtures if you're working with MyISAM tables in MySQL
  self.use_transactional_fixtures = true
  
  # Instantiated fixtures are slow, but give you @david where you otherwise would need people(:david)
  self.use_instantiated_fixtures  = false

  # Add more helper methods to be used by all tests here...
end
