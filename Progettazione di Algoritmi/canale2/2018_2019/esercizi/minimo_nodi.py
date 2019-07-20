from parti import parti

def minimo_nodi(grafo):
    grafo_parti = parti(grafo)

    # Mi ricavo i nodi (che sono componenti) sorgenti.
    sorgenti = set(grafo_parti)
    for nodo in grafo_parti: # I nodi che rimangono sono sorgenti.
        for adiacente in grafo_parti[nodo]:
            sorgenti.discard(adiacente)

    return len(sorgenti) # Una componente corrisponde almeno a un nodo.

def minimo_archi(grafo):
    # Perchè non voglio creare un ciclo.
    return minimo_nodi(grafo) - 1


