graph = {
 #   'A': ['B', 'D', 'C'],
 #   'B': ['A', 'G'],
 #   'C': ['A', 'G'],
 #   'D': ['A'],
 #   'E': ['G'],
 #   'F': ['G', 'L'],
 #   'G': ['E', 'F'],
 #   'L': ['F',],
    'P' : ['Q', 'R', 'S'],
    'Q' : ['P', 'R'],
    'R' : ['P', 'Q', 'T'],
    'S' : ['P'],
    'T' : ['R']
}

visited = [] # List to keep track of visited nodes.
queue = []     #Initialize a queue

def bfs(visited, graph, node):
  visited.append(node)
  queue.append(node)

  while queue:
    s = queue.pop(0)
    print(s, end= ' ')

    for neighbour in graph[s]:
      if neighbour not in visited:
        visited.append(neighbour)
        queue.append(neighbour)

# Driver Code
bfs(visited, graph, 'P')
