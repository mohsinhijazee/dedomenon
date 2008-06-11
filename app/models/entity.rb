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

# *Description*
#     The +Entity+ class is the object oriented layer on top of the underlying
#     +entities+ table. +entities+ table stores the table of a database in
#     MyOwnDB. The fields are stored in the +details+ table.
#     See Database class for further reference.
#     
# *Fields*
#     Has following fields:
#       * id
#       * database_id
#       * name
#       * has_public_form
# *Relations*
#     	* has_and_belongs_to_many :details, :join_table => "entities2details"
#       * has_many :relations_to_children, :class_name => "Relation",  :foreign_key => "parent_id"
#	* has_many :relations_to_parents, :class_name => "Relation",  :foreign_key => "child_id"
#       * has_many :entity_details
#       * has_many :instances, :dependent => :destroy
#       * belongs_to :database
#
class Entity < ActiveRecord::Base
  include Rest::UrlGenerator
  has_and_belongs_to_many :details, :join_table => "entities2details"
  #has_and_belongs_to_many :entities, :join_table => "relations", :foreign_key => "parent_id", :association_foreign_key => "child_id"
  has_many :relations_to_children, :class_name => "Relation",  :foreign_key => "parent_id"
  has_many :relations_to_parents, :class_name => "Relation",  :foreign_key => "child_id"
  has_many :entity_details
  has_many :instances, :dependent => :destroy
  belongs_to :database
  
  attr_readonly   :id,
                  :database_id
                
  attr_protected  :details_url,
                  :instances_url,
                  :relations_url

  # Returns the list ordered according to the display order specified by the administrator in the admin part of the application
  def ordered_details
    # when iterating, we need to use detail_id to get the detail's id.
    self.details.sort{|a,b| a.display_order<=>b.display_order}
  end

  # Returns the list of details NOT to be displayed in list view. The display in list views can be toggled in the admin part.
  #Should go with details REST 
  def details_in_list_view
    self.details.sort{|a,b| a.display_order<=>b.display_order}.delete_if{|d| d.displayed_in_list_view!='t'}
  end

  # returns true if this entity has at least one detail of type file attachment
  def has_file_attachment_detail?
    details.collect{|d| d.data_type.name}.uniq.include?("madb_s3_attachment")
  end
  
  #alias to_json old_to_json
       
  #FIXME: Add the options behaviour as a standard behaviour
  #FIXME: When the initial string is null, should proceed next.
  def to_json(options={})
    
    json = JSON.parse(super(options))
    replace_with_url(json, 'id', :Entity, options)
    replace_with_url(json, 'database_id', :Database, options)
    
    format = ''
    format = '.' + options[:format] if options[:format]
    
    json[:details_url] = @@lookup[:Entity] % [@@base_url, self.id]
    json[:details_url] += (@@lookup[:Detail] % ['', '']).chop + format
    
    json[:instances_url] = @@lookup[:Entity] % [@@base_url, self.id]
    json[:instances_url] += (@@lookup[:Instance] % ['', '']).chop + format
    
    json[:relations_url] = @@lookup[:Entity] % [@@base_url, self.id]
    json[:relations_url] += (@@lookup[:Relation] % ['', '']).chop + format
    
  
    return json.to_json
    
#    #json = old_to_json(opts)
#    
#    # remove any whitespace
#    json.strip!
#    
#    # Subtitute the escape sequence chracters
#    json.gsub!(/\\/, '')
#    
#    # Delete the bracket
#    json.delete!('}')
#    
#    # remove the enclosing quote symbols
#    if json.length > 2
#      json = json[1, json.length]
#    end
#    
#    json.chop!
#    
#    base_url = 'http://localhost:3000/'
#    self_url = '"' + base_url + "entities/#{id}" + '"'
#    database_url = '"' + base_url + "databases/#{database_id}" + '"'
#    
#    json.gsub!(/("id":\s+\d+)/, '"url": ' + self_url )
#    json.gsub!(/("database_id":\s+\d+)/, '"database_url": ' + database_url )
#    
#    
#    
#    base_url = 'http://localhost:3000/'
#    str = '"has_file_attachment_detail": '  +  j(has_file_attachment_detail?) + ', ' +
#      '"details_url":'          + '"' + base_url + "entities/#{id}/details.json"   + '"' + ', ' +
#      '"instances_url": '       + '"' + base_url + "entities/#{id}/instances.json" + '"' + ', ' +
#      '"relations_url":'        + '"' + base_url + "entities/#{id}/relations.json" + '"'
#          
#          
#    
#    
#    
#    json = json + ', ' + str + '}'
#    
#    
#    
#    
#    
#    return json;
#    
#       
  end
end
