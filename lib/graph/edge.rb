class Graph::Edge
  attr_reader :ukey, :graph, :from, :to

  def initialize(from, to)
    @from = from
    @to = to
    @ukey = "from_#{from.uid}_to_#{to.uid}"
  end

  private

  def add_to(graph)
    @graph = graph
  end
end
