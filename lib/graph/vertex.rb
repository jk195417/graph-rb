class Graph::Vertex
  attr_accessor :attachment
  attr_reader :uid, :graph
  @@autoincrement_counter = 0

  def initialize(attachment = nil)
    uid = @@autoincrement_counter += 1
    @uid = uid
    @attachment = attachment
  end

  private

  def add_to(graph)
    @graph = graph
  end
end
