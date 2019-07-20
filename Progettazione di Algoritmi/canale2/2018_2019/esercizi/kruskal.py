from unionfind import Unionfind

def kruskal(grafo):
    '''Restituisce un albero di copertura con costo minimo.'''

    albero = {nodo:[] for nodo in grafo}
    albero_archi = 0

    archi = set()
    for nodo in grafo:
        for dest, costo in grafo[nodo]:
            if (costo, dest, nodo) not in archi: # Evita i doppioni.
                archi.add((costo, nodo, dest))

    archi = sorted(list(archi), reverse=True) # Perchè poi faccio pop.

    componenti = Unionfind(len(grafo))

    while albero_archi < len(grafo) - 1:
        costo, a, b = archi.pop()

        comp_a, comp_b = componenti.find(a), componenti.find(b)

        if comp_a != comp_b:
            componenti.union(comp_a, comp_b)

            albero[a].append((costo, b))
            albero[b].append((costo, a))

            albero_archi += 1

    return albero
