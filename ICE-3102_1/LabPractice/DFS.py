graph={
    'P' : ['Q', 'R', 'S'],
    'Q' : ['P', 'R'],
    'R' : ['P', 'Q', 'T'],
    'S' : ['P'],
    'T' : ['R']
}
visited = []

def dfs(visited, graph, node):
    if node not in visited:
        print(node, end= " ")
        visited.append(node)
        for neighbour in graph[node]:
            dfs(visited, graph, neighbour)
    
dfs(visited, graph, 'P')