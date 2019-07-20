from collections import deque
from math import inf

def distanza(insieme_1, insieme_2, grafo):
    def bfs(nodo, grafo):
        distanze = [-1 for _ in grafo]
        distanze[nodo] = 0

        coda = deque()
        coda.append(nodo)

        while coda:
            nodo = coda.popleft()

            for adiacente in grafo[nodo]:
                if distanze[adiacente] < 0:
                    distanze[adiacente] = distanze[nodo] + 1
                    coda.append(adiacente)

        return distanze

    # Creo un nuovo nodo attaccato ai nodi del primo insieme.
    grafo_copy = {nodo:grafo[nodo] for nodo in grafo}
    nodo = len(grafo)
    grafo_copy[nodo] = [nodo for nodo in grafo if nodo in insieme_1]

    distanze = bfs(nodo, grafo_copy)

    minDistanza = inf
    for nodo in grafo:
        if nodo in insieme_2 and distanze[nodo] >= 0:
            if distanze[nodo] < minDistanza:
                minDistanza = distanze[nodo]

    return minDistanza - 1
