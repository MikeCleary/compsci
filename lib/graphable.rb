require 'graphviz'

module Graphable
  def to_png(output_file = "graph.png")
    g = GraphViz.new(:G, :type => :graph)

    vertices.each do |v|
      from_node = g.add_nodes(v.data)
      v.edges.values.each do |e|
        unless e.printed
          to_node = g.add_nodes(e.to.data)
          g.add_edges(from_node, to_node, :label => e.cost)
          e.to.edges[v.data].printed = true
        end
      end
    end

    g.output(:png => output_file)
  end
end