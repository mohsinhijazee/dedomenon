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

class EntityTest < Test::Unit::TestCase
  fixtures :entities, :details, :entities2details

  def setup
    @entity = Entity.find(12)
  end

  # Replace this with your real tests.
  def test_ordered_details
    assert_equal  @entity.details.sort{|a,b| a.display_order<=>b.display_order},  @entity.ordered_details
    assert_equal ["nom", "prenom", "fonction", "service", "coordonees_specifiques", "company_email"], @entity.ordered_details.map{|d| d.name}
  end
  
  # Replace this with your real tests.
  def test_list_details
    assert_equal  5, @entity.details_in_list_view.size
    assert_equal ["nom", "prenom", "fonction", "service", "company_email"], @entity.details_in_list_view.map{|d| d.name}
  end
  
  def test_generated_json
    model = Entity
    
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
