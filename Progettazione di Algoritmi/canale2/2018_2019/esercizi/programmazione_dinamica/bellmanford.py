def bellmanford(grafo, x):
    def grafo_trasposto():
        grafo_t = {nodo:[] for nodo in grafo}

        for nodo in grafo:
            for adiacente, costo in grafo[nodo]:
                grafo_t[adiacente].append((nodo, costo))

        return grafo_t

    from math import inf

    n = len(grafo)

    T = [[inf for _ in range(n)] for _ in range(n)]
    T[0][x] = 0

    P = [inf for _ in range(n)]
    P[x] = x

    for adiacente, costo in grafo[x]:
        T[0][adiacente] = costo
        P[adiacente] = x

    grafo_t = grafo_trasposto()

    for i in range(1, n): # riga della tabella
        for nodo in range(n):
            minimo = T[i - 1][nodo]

            for adiacente, costo in grafo_t[nodo]:
                v = T[i - 1][adiacente] + costo
                if v < minimo: # Se cambia allora cambia anche il padre.
                    minimo = v
                    P[nodo] = adiacente

            T[i][nodo] = minimo

    return T[n - 1], P


def cicli_negativi(grafo):
    def bellmanford_cicli(grafo, x):
        def grafo_trasposto(grafo):
            grafo_t = {nodo:[] for nodo in grafo}

            for nodo in grafo:
                for adiacente, costo in grafo[nodo]:
                    grafo_t[adiacente].append((nodo, costo))

            return grafo_t

        from math import inf

        n = len(grafo)

        T = [[inf for _ in range(n)] for _ in range(n + 1)]
        T[0][x] = 0

        for adiacente, costo in grafo[x]:
            T[0][adiacente] = costo

        grafo_t = grafo_trasposto(grafo)

        for i in range(1, n + 1): # riga della tabella
            for nodo in range(n):
                minimo = T[i - 1][nodo]

                for adiacente, costo in grafo_t[nodo]:
                    minimo = min(T[i - 1][adiacente] + costo, minimo)

                T[i][nodo] = minimo

        return T[n - 1], T[n]

    if len(grafo) <= 1:
        return False

    grafo_modificato = {nodo:grafo[nodo].copy() for nodo in grafo}
    nodo = len(grafo)
    grafo_modificato[nodo] = [(nodo,0) for nodo in grafo]

    T = bellmanford_cicli(grafo_modificato, nodo)

    return T[0] != T[1]
