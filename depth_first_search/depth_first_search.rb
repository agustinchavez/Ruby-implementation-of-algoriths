class DepthFirstSearch

  def initialize(graph, source_node)
    @graph = graph
    @source_node = source_node
    @conquered = []
    @edge_to = {}
    depth_first_search(source_node)
  end

  def path(node)
    return unless connection_to?(node)
    path_array = []
    current_node = node
    while(current_node != @source_node) do
      path_array.unshift(current_node)
      current_node = @edge_to[current_node]
    end
    path_array.unshift(@source_node)
  end

  private

  def connection_to?(node)
    @conquered.include?(node)
  end

  def depth_first_search(node)
    @conquered << node
    node.adjacents.each do |adj_node|
      next if @conquered.include?(adj_node)
      depth_first_search(adj_node)
      @edge_to[adj_node] = node
    end
  end

end
