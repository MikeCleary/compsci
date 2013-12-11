class Vertex

  attr_accessor :data
  attr_accessor :edges
  attr_accessor :distance
  attr_accessor :visited

  def initialize(data)
    self.data = data
    self.edges = Hash.new
    self.distance = 1e99
  end

  def adjacent?(to_node)
    edges.include?(to_node.data)
  end

  def to_s
    data
  end

end