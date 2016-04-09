class Graph

  def add_e(node_a, node_b)
    node_a.neighbors << node_b
    node_b.neighbors << node_a
  end

end
