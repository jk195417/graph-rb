require 'graph/version'
require 'graph/vertex'
require 'graph/edge'

class Graph
  attr_reader :vertices, :edges

  def initialize(vertices = [], edges = [])
    @vertices = vertices
    @edges = edges
  end

  def include?(vertex_or_edge)
    return include_vertex?(vertex_or_edge) if vertex_or_edge.is_a?(Graph::Vertex)
    return include_edge?(vertex_or_edge) if vertex_or_edge.is_a?(Graph::Edge)
  end

  def index_of(vertex_or_edge)
    return index_of_vertex(vertex_or_edge) if vertex_or_edge.is_a?(Graph::Vertex)
    return index_of_edge(vertex_or_edge) if vertex_or_edge.is_a?(Graph::Edge)
  end

  def add(vertex_or_edge)
    return add_vertex(vertex_or_edge) if vertex_or_edge.is_a?(Graph::Vertex)
    return add_edge(vertex_or_edge) if vertex_or_edge.is_a?(Graph::Edge)
  end

  def delete(vertex_or_edge)
    return delete_vertex(vertex_or_edge) if vertex_or_edge.is_a?(Graph::Vertex)
    return delete_edge(vertex_or_edge) if vertex_or_edge.is_a?(Graph::Edge)
  end

  def to_h
    # O(vertices.size) + O(edges.size)
    result = {}
    @vertices.each do |vertex|
      result[vertex.key] = vertex.to_h
    end
    @edges.each do |edge|
      result[edge.from.key][:edges] << edge.to_h
      result[edge.to.key][:edges] << edge.to_h
    end
    result
  end

  private

  def include_vertex?(vertex)
    @vertices.include? vertex
  end

  def include_edge?(edge)
    @edges.include? edge
  end

  def index_of_vertex(target)
    @vertices.index { |vertex| vertex.key == target.key }
  end

  def index_of_edge(target)
    @edges.index { |edge| edge.key == target.key }
  end

  def add_vertex(vertex)
    return false if index_of_vertex(vertex)

    vertex.send(:add_to, self)
    @vertices << vertex
    self
  end

  def add_edge(edge)
    return false if index_of_edge(edge)

    add_vertex(edge.from)
    add_vertex(edge.to)
    edge.send(:add_to, self)
    @edges << edge
    self
  end

  def delete_vertex(vertex)
    idx = index_of_vertex vertex
    return false unless idx

    edges.each do |edge|
      delete_edge(edge) if (edge.from.key == vertex.key) || (edge.to.key == vertex.key)
    end
    vertex.send(:add_to, nil)
    @vertices.delete_at idx
    self
  end

  def delete_edge(edge)
    idx = index_of_edge edge
    return false unless idx

    edge.send(:add_to, nil)
    @edges.delete_at idx
    self
  end

  alias << add
end
