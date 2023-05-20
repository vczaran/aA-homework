require "set"

class GraphNode

 attr_accessor :val, :neighbors

  def initialize(val)
    self.val = val
    self.neighbors = []
  end

  def add_neighbor(node)
    self.neighbors << node
  end

end


  def bfs(start_node, target)
    visited = Set.new()
    queue = [start_node]
   
    until queue.empty?
        node = queue.shift
            unless visited.include?(node)
                return node if node.val == target
                visited.add(node)
                queue += node.neighbors
            end
        end

        nil
    end

  a = GraphNode.new('a')
  b = GraphNode.new('b')
  c = GraphNode.new('c')
  d = GraphNode.new('d')
  e = GraphNode.new('e')
  f = GraphNode.new('f')
  a.neighbors = [b, c, e]
  c.neighbors = [b, d]
  e.neighbors = [a]
  f.neighbors = [e]
  
  p bfs(a, "b")
  p bfs(a, "f")

