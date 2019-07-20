from tarjan import tarjan
from parti import parti

def trovaPrincipale(grafo):
    '''Restituisce il nodo principale del grafo (ossia che può raggiungere tutti
    gli altri nodi) se esiste, altrimenti restituisce -1. Costo O(n + m).'''

    def dfs(nodo, grafo):
        for adiacente in grafo[nodo]:
            if padri[adiacente] == adiacente:
                padri[adiacente] = nodo
                dfs(adiacente, grafo)

    # Mi ricavo il grafo delle parti poichè esso essendo un DAG posso calcolarmi
    # il vettore dei padri senza problemi.
    nodi_componenti = tarjan(grafo)
    grafo_componenti = parti(grafo)

    # Metto un 0 in prima posizione perchè le comp. partono da 1 ma un array
    # parte da 0!
    padri = [0] + [nodo for nodo in grafo_componenti]

    for nodo in grafo_componenti: # il grafo non è connesso.
        if padri[nodo] == nodo:
            dfs(nodo, grafo_componenti)

    # Ci possono essere più nodi radice, in tal caso non c'è un nodo principale.
    principale = [nodo for nodo in grafo_componenti if padri[nodo] == nodo]

    if len(principale) == 1:
        # Ho il nome della componente, mi serve un qualsiasi nodo di tale comp.
        for nodo in grafo:
            if nodi_componenti[nodo] == principale[0]:
                return nodo
    else:
        return -1

def minPrincipali(grafo):
    def dfs(nodo, grafo):
        for adiacente in grafo[nodo]:
            if padri[adiacente] == adiacente:
                padri[adiacente] = nodo
                dfs(adiacente, grafo)

    # Mi ricavo il grafo delle parti poichè esso essendo un DAG posso calcolarmi
    # il vettore dei padri senza problemi.
    nodi_componenti = tarjan(grafo)
    grafo_componenti = parti(grafo)

    # Metto un 0 in prima posizione perchè le comp. partono da 1 ma un array
    # parte da 0!
    padri = [0] + [nodo for nodo in grafo_componenti]

    for nodo in grafo_componenti: # il grafo non è connesso.
        if padri[nodo] == nodo:
            dfs(nodo, grafo_componenti)

    return len([nodo for nodo in grafo_componenti if padri[nodo] == nodo])
