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

# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format 
# (all these examples are active by default):
 ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
  inflect.irregular 'datatype'            , 'datatypes'
  inflect.irregular 'database'            , 'databases'
  inflect.irregular 'entity'              , 'entities'
  inflect.irregular 'detail'              , 'details'
  inflect.irregular 'instance'            , 'instances'
  inflect.irregular 'relation'            , 'relations'
  inflect.irregular 'link'                , 'links'
  inflect.irregular 'proposition'         , 'propositions'
  inflect.irregular 'value'               , 'values'
  inflect.irregular 'relation_side_type'  , 'relation_side_types'
  inflect.irregular 'user'                , 'users'
  inflect.irregular 'user_type'           , 'user_types'
  inflect.irregular 'account'             , 'accounts'
  inflect.irregular 'account_type'        , 'account_types'
  inflect.irregular 'detail_status'        , 'detail_statuses'

 end
