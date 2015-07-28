# Description:

# Create a method to_h that accepts a list, and converts it to a hash of key-value pairs.

# Here's a simple example:

# animals = [["cat", "dog"], ["duck", "cow"]]
# to_h(animals)
#     #=> {"cat" => "dog", "duck" => "cow"}
# If you need help, here's a reference:

# http://www.rubycuts.com/enum-to-h

def to_h list
  list.t_h
end

def to_h list
  Hash[list]
end

def to_h list
  list.flatten.each_slice(2).to_h
end

def to_h list
  list.inject({}) {|r, el| r.merge(el[0] => el[1])}
end

def to_h list
  h = {}
  list.each { |k, v| h[k] = v }
  h
end
