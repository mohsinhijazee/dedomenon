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

class MadbSettings
  def self.european_countries
    ["Austria", "Belgium", "Cyprus", "Czech Republic", "Denmark", "England", "Espana", "Estonia", "Finland", "France", "Germany", "Greece", "Hungary", "Ireland", "Italy", "Latvia", "Lithuania", "Luxembourg", "Malta", "Poland", "Portugal", "Slovakia", "Slovenia", "Spain", "Sweden", "Netherlands", "United Kingdom"]
  end
end


module MadbClassFromName
  def class_from_name(className)
    const = ::Object
    klass = const.const_get(className)
    if klass.is_a?(::Class)
      klass
    else
      raise "Class #{className} not found"
    end
  end
end
