###############################################################################
# Title:  Jurassic Summer Challenge Solution
# Author: 143crimson
# Date:   07/25/2024
###############################################################################
# https://en.wikipedia.org/wiki/Ford%E2%80%93Fulkerson_algorithm#Python_implementation_of_Edmonds%E2%80%93Karp_algorithm
class Graph
  def initialize(graph)
    @graph = graph
    @row = graph.length
  end

  def bfs(s, t, parent)
    visited = [false] * @row

    queue = []

    queue.append(s)
    visited[s] = true

    while !queue.empty?
      u = queue.shift

      @graph[u].each_with_index do |val, ind|
        if (visited[ind] == false) and (val > 0)
          queue.append(ind)
          visited[ind] = true
          parent[ind] = u
        end
      end
    end

    visited[t]
  end

  def edmonds_karp(source, sink)
    parent = [-1] * @row
    max_flow = 0

    while bfs(source, sink, parent)
      path_flow = Float::INFINITY
      s = sink

      while s != source
        path_flow = [path_flow, @graph[parent[s]][s]].min
        s = parent[s]
      end

      max_flow += path_flow

      v = sink
      while v != source
        u = parent[v]
        @graph[u][v] -= path_flow
        @graph[v][u] += path_flow
        v = parent[v]
      end
    end

    max_flow
  end
end

i = Float::INFINITY
GRAPH = [
   #0  #1  #2  #3  #4  #5  #6  #7  #8  #9  #10 #11 #12 #13 #14#15 #16 #17
   #S  #A  #B  #C  #D  #E  #F  #G  #H  #I  #J  #K  #L  #M  #N  #0  #P  #Q  #T
  [ 0,  i,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  i,  0,  0,  0,  0,  0,  0], #S
  [ 0,  0,  0,  0,  0, 23, 17,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], #A
  [ 0, 23,  0, 20,  0,  0,  0, 30,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], #B
  [ 0,  0,  0,  0,  4,  0,  0, 18,  7,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], #C
  [ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  i], #D
  [ 0,  0,  0,  0,  0,  0, 13,  0,  0,  0, 21, 28, 19,  0,  0,  0,  0, 10,  0], #E
  [ 0,  0, 29,  9,  0,  0,  0, 14,  0,  0,  0, 19,  0,  0,  0,  0,  0,  0,  0], #F
  [ 0,  0,  0,  0,  5,  0,  0,  0, 10,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], #G
  [ 0,  0,  0,  0, 28,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], #H
  [ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 21,  0,  0,  0,  0], #I
  [ 0,  0,  0,  0,  0,  0,  0,  0,  0, 19,  0,  0,  0,  0, 29,  9,  0,  0,  0], #J
  [ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 25,  0,  0,  0,  0,  7, 18, 15,  0], #K
  [ 0,  0,  0,  0,  0,  0, 21, 19,  0,  0,  0, 13,  0, 23,  0,  0, 29,  0,  0], #L
  [ 0,  0,  0,  0,  0,  0, 12, 14, 24,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], #M
  [ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  i], #N
  [ 0,  0,  0,  0,  0,  0,  0,  0,  0,  9,  0,  0,  0,  0, 18,  0,  0,  0,  0], #O
  [ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 20,  0,  0,  0,  0,  8,  0,  0,  0], #P
  [ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], #Q
  [ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], #T
]

graph    = Graph.new(GRAPH)
source   = 0
sink     = 18
max_flow = graph.edmonds_karp(source, sink)

def my_favorite_dinosaur(is: "Tyrannosaurus Rex", because: "I think they're really cool!")
  "My favorite dinosaur is #{is} because #{because}"
end

def the_total_guests_evacuated(is:)
  "The total guests that can be evacuated is #{is}."
end

puts my_favorite_dinosaur
puts the_total_guests_evacuated(is: max_flow * 2)
