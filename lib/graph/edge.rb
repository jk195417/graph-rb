class Graph::Edge
  attr_reader :ukey, :graph, :from, :to
  attr_accessor :weight

  def initialize(from, to, weight: weight)
    @from = from
    @to = to
    @weight = weight
    @ukey = "from_#{from.uid}_to_#{to.uid}"
  end

  private

  def add_to(graph)
    @graph = graph
  end
end
