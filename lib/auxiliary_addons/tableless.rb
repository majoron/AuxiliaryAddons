class Tableless
  # Mixin validation
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  # Initializer
  def initialize(props = {})
    props.each do |name, value|
      send("#{name}=", value)
    end
  end

  # Overload persisted?
  def persisted?
    false
  end
end
