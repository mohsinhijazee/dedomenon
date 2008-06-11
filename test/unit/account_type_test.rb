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

require File.dirname(__FILE__) + '/../test_helper'

class AccountTypeTest < Test::Unit::TestCase
  fixtures :account_types

  def setup
    @account_type = AccountType.find(1)
  end

  def test_generated_json
    
    model = AccountType
    
    #Get first item!
    item = model.find(:all).to_json(:format => 'json')
    
    assert_nothing_raised do
      JSON.parse item
    end
    
    assert_nothing_thrown do
      JSON.parse item
    end
    
  end
end
