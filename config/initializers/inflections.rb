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
