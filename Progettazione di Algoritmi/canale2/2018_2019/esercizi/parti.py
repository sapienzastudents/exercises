from tarjan import tarjan

def parti(grafo):
    '''Restituisce un grafo contentente un nodo per ogni compontene fortemente
    connessa del grafo passato in input. Fra due nodi x, y c'è l'arco (x,y) se
    dalla componente fortemente connessa di x si può raggiungere quella di y.

    Il grafo restituito è un DAG. Calcolo in tempo O(n + m).'''

    def dfs(nodo):
        '''Visita la componente fortemente connessa del nodo, aggiungendo archi
        nel grafo delle parti se può raggiungere altre componenti fortemente
        connesse.'''
        comp_nodo = componenti[nodo]

        for adiacente in grafo[nodo]:
            comp_adiacente = componenti[adiacente]

            if comp_nodo != comp_adiacente:
                # Significa che si è passati in un'altra componente, quindi
                # creo l'arco senza visitare tale componente.
                parti[comp_nodo].add(comp_adiacente)
            elif not visitati[adiacente]:
                # È un nodo della stessa compononente, lo visito.
                visitati[adiacente] = True
                dfs(adiacente)

    componenti = tarjan(grafo)

    # Creo il grafo senza archi dal vettore delle componenti. Utilizzo gli
    # insiemi perchè da una componente si potrebbe raggiungere un'altra in più
    # modi.
    parti = {componente:set() for componente in set(componenti)}

    visitati = [False for _ in grafo]

    for nodo in grafo: # ogni dfs è la visita di una componente.
        if not visitati[nodo]:
            visitati[nodo] = True
            dfs(nodo)

    return {componente:list(parti[componente]) for componente in parti}
