class Graph::Vertex
  attr_reader :uid, :graph
  attr_accessor :attachment
  
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
