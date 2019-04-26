class Graph::Vertex
  attr_reader :key, :graph
  attr_accessor :attachment

  @@autoincrement_counter = 0

  def initialize(key: nil, attachment: nil)
    @key = key || (@@autoincrement_counter += 1)
    @attachment = attachment
  end

  def to_h
    { edges: [], attachment: attachment.to_h }
  end

  private

  def add_to(graph)
    @graph = graph
  end
end
