# Include hook code here
#
ActionController::Base.send :include,  Translations
ActiveRecord::Base.send :include, Translations
#ActionController::Base.send :model,  "translation"


