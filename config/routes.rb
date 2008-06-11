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

ActionController::Routing::Routes.draw do |map|

#map.connect 'accounts;login', 
#  :controller => :authentication, 
#  :action => :login,
#  :conditions => {:method => :post}

  # REST shoudl be disable while running the tests.
  # REST shold also be disabled if you are accessing the application from the 
  # old interface.
enable_rest = true

#                                *REST_API_REFERENCE_CHART*
#                                
#  *Resources*
#    Below is the list of resources available so far. The respective id of each resourec
#    just after it is implicit. For the last resource, its always :id otherwise
#    its of the form :SingularFormOfResource_id like for entities, its :entity_id
#    
#    TODO: Add the route for links!
#  *  /accounts
#  *  /accounts/users
#  *  /account_types (proposed)
#  *  /account_types/account_type_values(proposed)
#  *  /data_types
#  *  /entities
#  *  /entities/details
#  *  /entities/instances
#  *  /entities/instances/details/
#  *  /entities/relations
#  *  /details
#  *  /details/status (proposed) would be propagated on all levels
#  *  /details/detail_value_propositions (proposed)
#  *  /databases
#  *  /databases/details
#  *  /databases/entities
#  *  /databases/entities/details
#  *  /databases/entities/instances
#  *  /databases/entities/relations
#  *  /instances (proposed)
#  *  /instances/details/ (proposed)
#  *  /instances/details/detail_values (proposed)
#  *  /instances/details/ddl_detail_values (proposed)
#  *  /instances/details/date_detail_values (proposed)
#  
#  
#
  if enable_rest == true then
    
    map.resources :data_types, :singular => 'data_type', :controller => 'rest/data_types'
    
    map.resources :databases, :singular => 'database', :controller => 'rest/databases' do |database|
      database.resources :entities, :singular => 'entity', :controller => 'rest/entities'
      database.resources :details , :singular => 'detail', :controller => 'rest/details'
    end
    
    map.resources :entities, :singular => 'entity', :controller => 'rest/entities' do |entity|
      entity.resources :details, :singular => 'detail', :controller => 'rest/details'
      entity.resources :instances, :singular => 'instance', :controller => 'rest/instances'
      entity.resources :relations, :singular => 'relation', :controller => 'rest/relations'
    end
    
    map.resources :details, :singular => 'detail', :controller => 'rest/details' do |detail|
      detail.resources :propositions, :singular => 'proposition', :controller => 'rest/detail_value_propositions'
      # Useless
      #detail.resources :values, :singular => 'value', :controller => 'rest/values'
    end
    
    map.resources :instances, :singular => 'instance', :controller => 'rest/instances' do |instance|
      instance.resources :links, :singular => 'link', :controller => 'rest/links'
      instance.resources :details, :singular => 'detail', :controller => 'rest/details' do |detail|
        detail.resources :values, :singular => 'value', :controller => 'rest/values'
      end
    end
    
    map.resources :links, :singular => 'link', :controller => 'rest/links'
    
    map.resources :relations, :singular => 'relation', :controller => 'rest/relations'
    map.resources :relation_side_types, :singular => 'relation_side_type', :controller => 'rest/relation_side_types'
    
    map.resources :users, :singular => 'user', :controller => 'rest/users'
    map.resources :user_types, :singular => 'user_type', :controller => 'rest/user_types'
    
    map.resources :accounts, :singular => 'account', :controller => 'rest/accounts' do |account|
      account.resources :users, :singular => 'user', :controller => 'rest/users'
      account.resources :databases, :singular => 'database', :controller => 'rest/databases'
    end
    
    map.resources :account_types, :singular => 'account_type', :controller => 'rest/account_types'
    
    
    map.resources :propositions, :singular => 'proposition', :controller => 'rest/detail_value_propositions'
    map.resources :detail_statuses, :singular => 'detail_status', :controller => 'rest/detail_statuses'
    
    #map.resources :details, :singular => 'detail', :controller => 'rest/details'
    
#    #FIXME: Needs controller!
#    map.resources :account_types, :singular => 'account_type' do |account_type|
#      account_type.resources :account_type_values, :singular => 'account_type_value'
#    end
#    
#    map.resources :accounts, :singular => 'account' do |account|
#      account.resources :users, :singular => 'user', :controller => 'admin/users'
#    #    :collection => 
#    #      {
#    #        :login                      =>  :post, # Shold go with accounts colection
#    #        :logout                     =>  :any,  # same for all
#    #        :signup                     =>  :post,
#    #        :account_type_explanations  =>  :post,
#    #        
#    #      },
#    #        
##        ,:member =>
##          {
##            :verify                     =>  :put,
##            :change_password            =>  :post,
##            :forgot_password            =>  :post,
##          }
#
#    end
#
#    # For doing:
#   # GET entities
#   # GET entities/34
#   # DELETE entities/:entity_id/details/:id/unlink_detail
#   # POST   entities/:entity_id/details/:id/add_existing
#    map.resources :entities, :singular => 'entity', :controller => 'rest/entities' do |entity|
#      # DONE!
#      entity.resources :details, :singular => 'detail', :controller => 'rest/details' 
#      # We handle the instances here
#      # GET /entities/:entity_id/instances/
#      entity.resources :instances, :singular => 'instance', :controller => 'rest/instances'
#        
#      entity.resources :relations, :singular => 'relation', :controller => 'rest/relations'     
#    end
#    
#    # Same as above. However, the details are exposed at three levels:
#    # 1) The top most level for which the line below declares it to be a resource
#    # 2) Nested under databases. Deletion here deletes it from the system.
#    # 3) Nested under entities. Deletion here only unlinks.
#    map.resources :details, :singular => 'detail', :controller => 'rest/details'
#    
#    
#    map.resources :databases, :singular => 'database', :controller => 'rest/databases' do |database|
#      database.resources :details, :singular => 'detail', :controller => 'rest/details'
#      database.resources :entities, :singular => 'entity', :controller =>  'rest/entities' do |entity|
#        # This would only unlink!
#        # DONE!
#        entity.resources :details, :singular => 'detail', :controller => 'rest/details', 
#          :member => 
#          {
#            :unlink_detail => :delete,
#            :add_existing => :post,
#          },
#        :collection => 
#        {
#          :list_details => :get
#        }
#        entity.resources :relations, :singular => 'relation', :controller => 'rest/relations',
#          #PUT databases/:database_id/entities/:entity_id/relations/:id
#          :member => 
#          {
#            :add_link => :put,
#            :delete_link => :delete
#          },
#          #POST databases/:database_id/entities/:entity_id/relations/
#          #
#          :collection => 
#          {
#            :add_link => :post,
#            :show_links => :get
#          }
#          entity.resources :instances, :singular => 'instance', :controller => 'rest/instances'
#      end
#    
#    
#    
#    end
#
#   
#    
  end
#    

#map.resources :accounts, :member => 
#  {
#    :vat => :get,
#    :transfers_this_month => :get
#  }

  
  
  # Add your own custom routes here.
  # The priority is based upon order of creation: first created -> highest priority.
  
  # Here's a sample route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  map.connect '/app', :controller => "authentication", :action => "login"


  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':controller/service.wsdl', :action => 'wsdl'

  # Install the default route as the lowest priority.
  map.connect '/app/:controller/:action/:id'
  map.connect ':controller/:action/:id'
  # following is added to support the formats of response.
  map.connect ':controller/:action/:id.:format'
end