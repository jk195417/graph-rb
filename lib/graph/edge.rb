class Graph::Edge
  attr_reader :key, :graph, :from, :to
  attr_accessor :weight

  def initialize(from, to, weight: 1)
    @from = from
    @to = to
    @key = "from_#{from.key}_to_#{to.key}"
    @weight = weight
  end

  def to_h
    { from: from.key, to: to.key, weight: weight }
  end

  private

  def add_to(graph)
    @graph = graph
  end
end
