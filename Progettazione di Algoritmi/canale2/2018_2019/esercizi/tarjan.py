def tarjan(grafo):
    '''Restituisce il vettore delle componenti fortemente connesse del grafo
    diretto fornito come parametro, in tempo O(n + m).'''

    def dfs(nodo):
        nonlocal tempo, componente

        tempo += 1
        componenti[nodo] = -tempo
        stack.append(nodo)

        min_nodo = tempo

        for adiacente in grafo[nodo]:
            # Caso in cui ancora l'adiacente non è stato visitato.
            if componenti[adiacente] == 0:
                min_nodo = min(min_nodo,dfs(adiacente))
            # Caso in cui è stato visitato ma la componente non è impostata.
            elif componenti[adiacente] < 0:
                min_nodo = min(min_nodo, -componenti[adiacente])

        if min_nodo == -componenti[nodo]:
            # nodo è quindi una c-root, svuoto lo stack fino a nodo.
            componente += 1

            nodo_tmp = -1
            while nodo_tmp != nodo:
                nodo_tmp = stack.pop()
                componenti[nodo_tmp] = componente

        return min_nodo

    # componenti[nodo]: 0   - non è stato visitato
    #                   > 0 - visitato e componente impostata
    #                   < 0 - visitato ma senza componente settata
    componenti = [0 for _ in grafo]
    componente = tempo = 0 # contatore componenti e tempi.
    stack = []

    for nodo in grafo: # il grafo può essere sconnesso.
        if componenti[nodo] == 0:
            dfs(nodo)

    return componenti
