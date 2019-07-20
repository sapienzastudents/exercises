def quadrato_dict(grafo):
    # Uso gli insiemi così evito di controllare i doppioni.
    grafo_quadrato = {nodo : set(grafo[nodo]) for nodo in grafo}

    # Aggiungi per ogni nodo i nodi raggiungibili dagli adiacenti.
    for nodo in grafo:
        for adiacente in grafo[nodo]:
            for raggiungibile in grafo[adiacente]:
                grafo_quadrato[nodo].add(raggiungibile)

    return {nodo : list(grafo_quadrato[nodo]) for nodo in grafo_quadrato}

def quadrato_mat(grafo):
    grafo_quadrato = [[adiacente for adiacente in grafo[nodo]] for nodo
                      in range(len(grafo))]

    for nodo in range(len(grafo)):
        for adiacente in range(len(grafo)):
            # Escludo il controllo dello stesso nodo e dei nodi non
            # raggiungibili.
            if adiacente != nodo and grafo[nodo][adiacente] != 0:
                for raggiungibile in range(len(grafo)):
                    # Stesso controllo di sopra.
                    if adiacente != raggiungibile \
                       and grafo[adiacente][raggiungibile] != 0:
                           grafo_quadrato[nodo][raggiungibile] = 1

    return grafo_quadrato
