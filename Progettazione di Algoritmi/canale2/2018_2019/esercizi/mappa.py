def pericolo_minimo(mappa):

    def conversion(mappa):
        grafo = {nodo:[] for nodo in range(len(mappa) * len(mappa[0]))}
        col_size = len(mappa)
        row_size = len(mappa[0])

        for col in range(len(mappa)):
            for row in range(len(mappa[col])):
                nodo = (row_size * row) + col
                val_nodo = mappa[col][row]

                if (row >= 1):
                    nodo_up = (row_size * (row - 1)) + col
                    grafo[nodo].append((nodo_up,
                                        abs(val_nodo - mappa[col][row - 1])))

                if (row < row_size - 1):
                    nodo_down = (row_size * (row + 1)) + col
                    grafo[nodo].append((nodo_down,
                                        abs(val_nodo - mappa[col][row + 1])))

                if (col < col_size - 1):
                    nodo_right = (row_size * row) + (col + 1)
                    grafo[nodo].append((nodo_right,
                                        abs(val_nodo - mappa[col + 1][row])))

                if (col >= 1):
                    nodo_left = (row_size * row) + (col - 1)
                    grafo[nodo].append((nodo_left,
                                        abs(val_nodo - mappa[col - 1][row])))

        return grafo

    def dijkstra_modificato(nodo, grafo):
        from heapq import heappop, heappush

        min_costo = 0

        visitati = {nodo}

        # Inizializzo heap.
        heap = []
        for adiacente, costo in grafo[nodo]:
            heappush(heap, (costo, adiacente)) # così ordina per costo

        while heap:
            costo, nodo = heappop(heap)

            if costo > min_costo:
                min_costo = costo

            if nodo == len(grafo) - 1:
                break

            # Devo controllare che la coppia non sia vecchia.
            if nodo not in visitati:
                visitati.add(nodo)

                for adiacente, costo in grafo[nodo]:
                    if adiacente not in visitati:
                        heappush(heap, (costo, adiacente))

        return min_costo

    grafo = conversion(mappa)

    return dijkstra_modificato(0, grafo)
