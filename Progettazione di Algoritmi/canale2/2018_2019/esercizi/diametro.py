from math import inf
from collections import deque

def bfs(nodo, grafo):
    padri = [-1 for _ in grafo]
    padri[nodo] = nodo

    distanze = [inf for _ in grafo]
    distanze[nodo] = 0

    coda = deque([nodo])
    while coda:
        nodo = coda.pop()

        for adiacente in grafo[nodo]:
            if padri[adiacente] == -1:
                distanze[adiacente] = distanze[nodo] + 1
                padri[adiacente] = nodo
                coda.append(adiacente)

    return padri, distanze

def diametro_una_dfs(grafo):
    # GRAFO CONNESSO NON DIRETTO ACICLICO (ALBERO)
    def dfs(nodo):

        profondita_max_1 = 0
        profondita_max_2 = 0
        diametro_max = 0

        for adiacente in grafo[nodo]:
            # Non essendoci cicli rimane da escludere il padre.
            if not visitati[adiacente]:
                visitati[adiacente] = True
                profondita_max_adj, diametro_adj = dfs(adiacente)

                if profondita_max_adj > profondita_max_1:
                    profondita_max_2 = profondita_max_1
                    profondita_max_1 = profondita_max_adj
                elif profondita_max_adj > profondita_max_2:
                    profondita_max_2 = profondita_max_adj

                if diametro_adj > diametro_max:
                    diametro_max = diametro_adj

        # Il +1 conta il nodo in questione (se stesso).
        diametro_max = max(profondita_max_1 + profondita_max_2 + 1,
                           diametro_max)

        # Il +1 conta il nodo in questione (se stesso).
        return (profondita_max_1 + 1, diametro_max)

    visitati = [False for _ in grafo]

    visitati[0] = True
    return dfs(0)


def diametro_due_bfs(grafo):
    # GRAFO CONNESSO E NON DIRETTO!

    # Passi:
    # 1. Effettuo la bfs da un nodo qualsiasi Y (per convenzione 0), il costo è
    #    di O(n + m);
    # 2. Dalla BFS precedente trovo un nodo X a distanza massima da Y, la
    #    radice, il costo è di O(n);
    # 3. Effettuo una BFS dal nodo X, il costo è di O(n + m);
    # 4. Dalla BFS precedente trovo un nodo Z a distanza massima da X, la
    #    radice, il costo è di O(n);
    # Il diametro è proprio tale distanza, i due nodi interessati sono (X, Z).
    # Costo totale: O(n + m).

    def max_distanza(distanze):
        nodo_estremo = (-1, -1) # distanza, nodo (indice)
        for nodo in range(len(distanze)):
            if distanze[nodo] >= nodo_estremo[0]:
                nodo_estremo = distanze[nodo], nodo

        return nodo_estremo

    # Passo 1.
    _, distanze = bfs(0, grafo)

    # Passo 2.
    nodo_estremo = max_distanza(distanze)

    # Passo 3.
    _, distanze = bfs(nodo_estremo[1], grafo)

    # Passo 4.
    diametro = max_distanza(distanze)

    # Aggiungo 1 al diametro perchè il nodo da cui parto non viene contato dalla
    # BFS, ma in realtà andrebbe contato per il diametro.
    # (diametro, nodo estremo, nodo estremo o radice)
    return diametro[0] + 1, nodo_estremo[1], diametro[1]
