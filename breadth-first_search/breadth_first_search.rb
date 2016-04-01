class BreadthFirstSearch
  def initialize(graph, node)
    @graph = graph
    @node = node
    @conquered = []
    @edge_to = {}

    bfs(node)
  end

  def shortest_route_to(node)
    return unless has_route_to?(node)
    route = []
    while(node != @node) do
      route.unshift(node)
      node = @edge_to[node]
    end
    route.unshift(@node)
  end

  private
  def bfs(node)
    queue = []
    queue << node
    @conquered << node
    while queue.any?
      current_node = queue.shift
      current_node.adjacents.each do |adjacent_node|
        next if @conquered.include?(adjacent_node)
        queue << adjacent_node
        @conquered << adjacent_node
        @edge_to[adjacent_node] = current_node
      end
    end
  end

  def has_route_to?(node)
    @conquered.include?(node)
  end
end
