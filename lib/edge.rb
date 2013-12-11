class Edge
  attr_accessor :from
  attr_accessor :to
  attr_accessor :cost
  attr_accessor :printed

  def initialize(from, to, cost)
    self.from, self.to, self.cost = from, to, cost
  end

  def to_s
    "from: #{from.data} to: #{to.data}, cost: #{cost}"
  end
end