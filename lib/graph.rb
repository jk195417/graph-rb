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

  def add(vertex_or_edge)
    return add_vertex(vertex_or_edge) if vertex_or_edge.is_a?(Graph::Vertex)
    return add_edge(vertex_or_edge) if vertex_or_edge.is_a?(Graph::Edge)
  end

  def delete(vertex_or_edge)
    return delete_vertex(vertex_or_edge) if vertex_or_edge.is_a?(Graph::Vertex)
    return delete_edge(vertex_or_edge) if vertex_or_edge.is_a?(Graph::Edge)
  end

  def to_h
    result = {
      vertices: [],
      edges: []
    }
    @vertices.each do |vertex|
      result[:vertices] << vertex.uid
    end
    @edges.each do |edge|
      result[:edges] << { from: edge.from.uid, to: edge.to.uid }
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

  def add_vertex(vertex)
    return false if include_vertex?(vertex)

    vertex.send(:add_to, self)
    @vertices << vertex
    self
  end

  def add_edge(edge)
    return false if include_edge?(edge)

    edge.send(:add_to, self)
    add_vertex(edge.from)
    add_vertex(edge.to)
    @edges << edge
    self
  end

  def delete_vertex(vertex)
    return false unless include_vertex?(vertex)
    edges.each do |edge|
      delete_edge(edge) if (edge.from == vertex) || (edge.to == vertex)
    end
    vertex.send(:add_to, nil)
    @vertices.delete(vertex)
    self
  end

  def delete_edge(edge)
    return false unless include_edge?(edge)
    
    edge.send(:add_to, nil)
    @edges.delete(edge)
    self
  end
end