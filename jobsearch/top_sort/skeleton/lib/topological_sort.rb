require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  counts, queue, sorted = {}, [], []

  vertices.each do |vertex|
    counts[vertex] = vertex.in_edges.count
    queue << vertex if vertex.in_edges.empty?
  end

  until queue.empty?
    vertex = queue.shift
    sorted << vertex

    vertex.out_edges.each do |edge|
      to_vertex = edge.to_vertex

      counts[to_vertex] -= 1
      queue << to_vertex if counts[to_vertex] == 0
    end
  end

  sorted
end
