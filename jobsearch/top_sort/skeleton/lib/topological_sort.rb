require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  in_edge_counts = {}
  queue = []
  sorted_vertices = []

  vertices.each do |v|
    in_edge_counts[v] = v.in_edges.count
    queue << v if v.in_edges.empty?
  end

  until queue.empty?
    vertex = queue.shift
    sorted_vertices << vertex

    vertex.out_edges.each do |e|
      to_vertex = e.to_vertex

      in_edge_counts[to_vertex] -= 1
      queue << to_vertex if in_edge_counts[to_vertex] == 0
    end
  end

  sorted_vertices
end
