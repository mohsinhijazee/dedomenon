=begin
This class extends some of the classes.

* String gets random
* ActionView::Helpers::Form gets submit_tage
* ActiveRecord::Base gets class_from_name
* ActionController::Base gets class_from_name
* ActionView::Base gets class_from_name
* Test::Unit gets class_from_name
=end

class String
  def self.random(len=8)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    s = ""
    1.upto(len) { |i| s << chars[rand(chars.size-1)] }
    return s
  end
end

module ActionView
  module Helpers
    module FormTagHelper
      alias :old_submit_tag :submit_tag
      def submit_tag(value = "Save changes", options = {})
        old_submit_tag(value, options.update( :class => "submit"))
      end
    end
  end
end

# Add the MadbClassFromName to Active Record
module ActiveRecord
  class Base
    include MadbClassFromName
  end
end


# Add the MadbClassFromName to Action Conroller
module ActionController
  class Base
    include MadbClassFromName
  end
end

# Add the MadbClassFromName to Action View
module ActionView
  class Base
    include MadbClassFromName
  end
end

# Add the MadbClassFromName to the Testing framework
module Test
  module Unit
    class TestCase
      include MadbClassFromName
    end
  end
end
