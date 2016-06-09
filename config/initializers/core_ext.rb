class String
  def to_bool
    return true if self == true || self =~ (/^(true|t|yes|y|1)$/i)
    return false if self == false || self.blank? || self =~ (/^(false|f|no|n|none|0)$/i)
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end

  def underscore_capitalize
    self.underscore.split("_").map(&:capitalize).join("_")
  end
end

class Fixnum
  def to_bool
    return true if self == 1
    return false if self == 0
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end
end

class TrueClass
  def to_i; 1; end
  def to_bool; self; end
end

class FalseClass
  def to_i; 0; end
  def to_bool; self; end
end

class NilClass
  def to_bool; false; end
end

class Hash
  def key_value_swapped
    h = self.class.new
    each_pair do |k,v|
      h[v] = k
    end
    return h
  end
end

class Array
  def to_enum_hash
    res = {}
    each_with_index{ |item, index| res[index] = item }
    res
  end

  def to_enum_select_options_hash
    res = {}
    each_with_index{ |item, index| res[item] = index }
    res
  end
end
