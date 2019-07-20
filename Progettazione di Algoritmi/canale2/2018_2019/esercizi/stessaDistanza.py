def stessaDistanza(x, y, grafo):
    '''Restituisce l'insieme dei nodi con la stessa distanza da x e da y. Il
    grafo deve essere non diretto e connesso. Tempo O(n + m).'''

    def bfs(nodo):
        from collections import deque

        distanza = [-1 for _ in grafo]
        distanza[nodo] = 0

        coda = deque()
        coda.append(nodo)

        while coda:
            nodo = coda.popleft()

            for adiacente in grafo[nodo]:
                if distanza[adiacente] == -1:
                    distanza[adiacente] = distanza[nodo] + 1
                    coda.append(adiacente)

        return distanza

    distanza_x = bfs(x)
    distanza_y = bfs(y)

    stessaDist = set()

    for nodo in grafo:
        if distanza_x[nodo] == distanza_y[nodo]:
            stessaDist.add(nodo)

    return stessaDist
