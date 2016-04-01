class Graph

  def add_edge(first_node, second_node)
    first_node.adjacents << second_node
    second_node.adjacents << first_node
  end
end
