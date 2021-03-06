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
#   Instances are similar to rows in an RDBMS. Each instance has an id,
#   an +Entity+ to which it belongs and a timestamp which tells the time
#   of creation of that instance(row)
#   
# *Fields*
#   * id
#   * entity_id
#   * created_at
#   
#   PENDING: Understand links_to_children
# *Relationships*
#  * belongs_to :entity
#  * has_many :detail_values
#  * has_many :email_detail_values
#  * has_many :date_detail_values
#  * has_many :s3_attachments , :dependent => :destroy
#  * has_many :long_text_detail_values
#  * has_many :ddl_detail_values
#  * has_many :links_to_children, :class_name => "Link", :foreign_key => "parent_id"
#  * has_many :links_to_parents, :class_name => "Link", :foreign_key => "child_id"
#
class Instance < ActiveRecord::Base
  include ApplicationHelper
  #include InstanceProcessor
	belongs_to :entity
	has_many :detail_values
	has_many :email_detail_values
	has_many :date_detail_values
	has_many :file_attachments , :dependent => :destroy
	has_many :long_text_detail_values
	has_many :ddl_detail_values
	#has_and_belongs_to_many :children, :class_name => "Instance", :join_table => "links", :foreign_key => "parent_id", :association_foreign_key => "child_id"
	has_many :links_to_children, :class_name => "Link", :foreign_key => "parent_id"
	has_many :links_to_parents, :class_name => "Link", :foreign_key => "child_id"
  
  attr_readonly :id,
                :entity_id
       


#NOTE: We do not needs this method here because the module MadbClassFromName
#is incldued in the environment.rb which injects in in ActionController, ActiveRecord
#and UnitTest framework.
#
  #  def class_from_name(className)
#    #ObjectSpace.each_object(Class) do |c|
#    #  return c if c.name == className
#    #end
#    #raise "Class #{className} not found"
#    #
#    const = ::Object
#    klass = const.const_get(className)
#    if klass.is_a?(::Class)
#      klass
#    else
#      raise "Class #{className} not found"
#    end
#  end

  def self.before_destroy
    self.s3_attachments.clear
  end
  #def class_from_name(className)
  #  ObjectSpace.each_object(Class) do |c|
  #    return c if c.name == className
  #  end
  #  raise "Class #{className} not found"
  #end


# PENDING: Document this method
def detail_value(detail_name)
  return id if detail_name=="id"

  detail = Detail.find_by_name detail_name
  values = class_from_name(detail.data_type.class_name).find(:all, :conditions => "detail_id =#{detail.id} and instance_id=#{self.id}")
  #.delete_if { |detail_value| detail_value.detail.name!=detail_name}
  if values[0]
    logger.warn("======================================================= wil return #{ values[0].value }")
    return values[0].value
  else
    return nil
  end
end

  def has_detail_value?(value, detail = nil)
    if detail.nil?
      list = detail_values.delete_if { |d| !(d.value=~Regexp.new(value))}
      return list.length>0
    else
      return detail_value(detail.name)=~Regexp.new(value)
    end
  end

#  def to_json(options = {})
#    options[:instance] = self.id
#    
#    return get_records_for(options).to_json
##    json = super.to_json(options)
##    
##    base_url = 'http://localhost:3000/'
##    self_url = '"' + base_url + "instances/#{id}" + '"'
##    entity_url = '"' + base_url + "entities/#{entity_id}" + '"'
##    
##    json.gsub!(/("id":)\s+\d+/, '"url": ' + self_url)
##    json.gsub!(/("entity_id":\s+\d+)/, '"entity_url": ' + entity_url)
##    
##    return json;
##    
#  end
end
