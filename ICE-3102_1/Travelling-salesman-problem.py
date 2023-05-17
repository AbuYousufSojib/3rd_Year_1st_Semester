graph = [
    [0, 16, 11, 6],
    [8, 0, 13, 16],
    [4, 7, 0, 9],
    [5, 12, 2, 0]
]
n = 4
visited = (1 << n) - 1


def checkTsp(mask, pos):
    if (mask == visited):
        return graph[pos][0]
    ans = 99999999999999
    for city in range(n):
        if (mask & (1 << city)) == 0:
            newAns = graph[pos][city] + checkTsp(mask | (1 << city), city)
            ans = min(ans, newAns)
    return ans


print(checkTsp(1, 0))
