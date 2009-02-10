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
