
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
