def dijsktra_sparso(nodo, grafo):
    from heapq import heappop, heappush
    from math import inf

    distanze = [inf for _ in grafo]
    distanze[nodo] = 0

    visitati = {nodo}

    # Inizializzo heap.
    heap = []
    for adiacente, costo in grafo[nodo]:
        distanze[adiacente] = costo
        heappush(heap, (costo, adiacente)) # così ordina per costo

    while heap:
        costo, nodo = heappop(heap)

        # Devo controllare che la coppia non sia vecchia.
        if nodo not in visitati:
            visitati.add(nodo)

            for adiacente, costo in grafo[nodo]:
                if adiacente not in visitati:
                    if distanze[adiacente] > distanze[nodo] + costo:
                        distanze[adiacente] = distanze[nodo] + costo
                        heappush(heap, (distanze[adiacente], adiacente))

    return distanze
