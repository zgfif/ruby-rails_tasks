module Truncate
  def truncate(attr_name, length)
    define_method attr_name do
      required_length = length[:length]

      str = instance_variable_get("@#{attr_name}")

      required_length < str.length ? str.slice(0, required_length) + '...' : str
    end
  end
end
