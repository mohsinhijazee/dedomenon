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

require File.dirname(__FILE__) + '/../../test_helper'
require 'rest/user_types_controller'


# assert_response status_code
# assert_redirect
# assert_redirect_to
# Re-raise errors caught by the controller.
class Rest::UserTypesController; def rescue_action(e) raise e end; end


class UserTypesControllerTest < Test::Unit::TestCase
  
  fixtures  :account_types,
            :account_type_values,
            :accounts, 
            :databases, 
            :data_types, 
            :detail_status, 
            :details, 
            :detail_value_propositions, 
            :entities, 
            :entities2details, 
            :relation_side_types, 
            :relations, 
            :instances, 
            :detail_values, 
            :integer_detail_values, 
            :date_detail_values, 
            :ddl_detail_values, 
            :links, 
            :user_types, 
            :users
          
         
  def setup
    @controller   = Rest::UserTypesController.new
    @request      = ActionController::TestRequest.new
    @response      = ActionController::TestResponse.new
    
    @db1_admin_user_id = 2
  end
  
  def test_without_login
    assert true
#    id = 1
#    get :show, {:format => 'json', :id => id}, {'user' => nil}
#    assert_response 401
#    json = %Q~{"errors": ["Please login to consume the REST API"]}~
#    assert_equal json, @response.body  
  end
  
  def test_get_all
    # CASE 01: GET /user_types
    user = User.find @db1_admin_user_id
    ##################################################################
    #                        CASE 01
    #  GET /user_types
    ##################################################################
    json = UserType.find(:all)
    get :index, {:format => 'json'}, {'user' => user}
    assert_response :success
    result = JSON.parse(@response.body)
    assert_equal json.length, result['resources'].length
    
    
  end
  
  def test_get_all_with_pagination
    # CASE 01: Mention of start_index and max_results
    # CASE 02: Mention of Order by with direction
    # CASE 03: Mention of Order by without direction
    # CASE 04: Mention a condition also
    
    user = User.find_by_id(@db1_admin_user_id)
    
    parent_resource = :asdf
    parent_id = nil
    start_index = 0
    max_results = 3
    order_by = 'name'
    direction = 'DESC'
    table_name = 'data_types'
    conditions = 'database_id=6'
    #total_records = Detail.count_by_sql "SELECT COUNT(*) FROM  #{table_name} WHERE #{conditions}"
    conditions = 'id=50'
    
    total_records = UserType.count
    max_results = 2
    #########################################################
    #                        CASE 01
    #        Mention of start_index and max_results
    #########################################################
    get :index, {
      parent_resource => parent_id,
      :format => 'json', 
      :start_index => start_index, 
      :max_results => max_results},
      {'user' => user}
    
    #assert_equal '', @response.body
    assert_response 200
    result = @response.body
    result = JSON.parse result
    assert_equal max_results, result['resources'].length
    assert_equal total_records, result['total_resources']
    
    
    
    order_by = 'name'
    direction = 'desc'
    #########################################################
    #                        CASE 02
    #        Mention of order by with direction
    #########################################################
    get :index, {
      parent_resource => parent_id,
      :format => 'json', 
      :start_index => start_index, 
      :max_results => max_results,
      :order_by => order_by,
      :direction => direction
    },
      {'user' => user}
    
    #assert_equal '', @response.body
    assert_response 200
    result = @response.body
    result = JSON.parse result
    assert_equal max_results, result['resources'].length
    assert_equal 'desc', result['direction']
    assert_equal 1, result['resources'][0]['url'].chomp('.json')[/\d+$/].to_i
    
    #########################################################
    #                        CASE 03
    #        Mention of order by without direction
    #########################################################
    get :index, {
      parent_resource => parent_id,
      :format => 'json', 
      :start_index => start_index, 
      :max_results => max_results,
      :order_by => order_by,
      #:direction => direction
    },
      {'user' => user}
    
    #assert_equal '', @response.body
    assert_response 200
    result = @response.body
    result = JSON.parse result
    assert_equal max_results, result['resources'].length
    assert_equal 'asc', result['direction']
    assert_equal 2, result['resources'][0]['url'].chomp('.json')[/\d+$/].to_i
    
    conditions = "name='normal_user'"
    #########################################################
    #                        CASE 04
    #        Mention of order by specifying condition
    #########################################################
    get :index, {
      parent_resource => parent_id,
      :format => 'json', 
      :start_index => start_index, 
      :max_results => max_results,
      :order_by => order_by,
      :conditions => conditions
    },
      {'user' => user}
    #assert_equal '', @response.body
    assert_response 200
    result = @response.body
    result = JSON.parse result
    assert_equal 1, result['resources'].length
    assert_equal 'asc', result['direction']
    assert_equal 2, result['resources'][0]['url'].chomp('.json')[/\d+$/].to_i
  end
  
  def test_get_single
    # CASE 01: GET /user_types/:id with all ok
    # CASE 01: GET /user_types/:id with wrong id
    
    
    user = User.find @db1_admin_user_id
    user_type = 1
    ################################################################
    #                      CASE 01
    #  GET /user_types/:id with all ok
    ################################################################
    model = UserType.find(user_type)
    get :show, {:format => 'json', :id => user_type}, {'user' => user}
    assert_response :success
    assert_similar model, @response.body
    
    
    user_type = 9797
    ################################################################
    #                      CASE 02
    #  GET /user_types/:id with wrong id
    ################################################################
    json = {:errors => [ "UserType[#{user_type}] does not exists"]}.to_json
    get :show, {:format => 'json', :id => user_type}, {'user' => user}
    assert_response 404
    assert_equal json, @response.body
  end
  
  def test_post
    # CASE 01: POST /user_types
    
    user = User.find @db1_admin_user_id
    ################################################################
    #                      CASE 01
    #  POST /user_types
    ################################################################
    json = {:errors =>  ["Action 'create' not allowed on user types"]}.to_json
    post :create, {:format => 'json'}, {'user' => user}
    assert_response 400
    assert_equal json, @response.body
  end
  
  def test_put
    # CASE 01: PUT /user_types
    
    user = User.find @db1_admin_user_id
    ################################################################
    #                      CASE 01
    #  PUT /user_types
    ################################################################
    json = {:errors => ["Action 'update' not allowed on user types"]}.to_json
    post :update, {:format => 'json'}, {'user' => user}
    assert_response 400
    assert_equal json, @response.body
    
  end
  
  def test_delete
    # CASE 01: DELETE /user_types
    
    user = User.find @db1_admin_user_id
    ################################################################
    #                      CASE 01
    #  DELETE /user_types
    ################################################################
    json = {:errors => ["Action 'destroy' not allowed on user types"]}.to_json
    post :destroy, {:format => 'json'}, {'user' => user}
    assert_response 400
    assert_equal json, @response.body
  end
  
  
  

end
  
  
