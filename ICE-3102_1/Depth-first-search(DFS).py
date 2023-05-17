graph = {
    'P' : ['Q', 'R', 'S'],
    'Q' : ['P', 'R'],
    'R' : ['Q', 'T'],
    'S' : ['P'],
    'T' : ['R']
}

visited = []  # Array to keep track of visited nodes.


def dfs(visited, graph, node):
    if node not in visited:
        print(node, end=' ')
        visited.append(node)
        for neighbour in graph[node]:
            dfs(visited, graph, neighbour)


# Driver Code
dfs(visited, graph, 'P')
