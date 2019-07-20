def radicazione(grafo):
    def dfs(nodo):
        nonlocal root, costo

        if nodo in sorgenti:
            costo_nodo = costo * -1

            if costo_nodo > costo:
                costo = costo_nodo
                root = nodo

        for adiacente in grafo_indiretto[nodo]:
            if adiacente not in visitati:
                visitati.add(adiacente)

                costo += +1 if adiacente in grafo[nodo] else -1
                dfs(adiacente)

    # Mi trovo prima le sorgenti del grafo diretto.
    sorgenti = set(grafo)

    for nodo in grafo:
        for adiacente in grafo[nodo]:
            sorgenti.discard(adiacente)

    # Ora mi creo il grafo non diretto.
    grafo_indiretto = {nodo:set() for nodo in grafo}

    for nodo in grafo:
        for adiacente in grafo[nodo]:
            grafo_indiretto[nodo].add(adiacente)
            grafo_indiretto[adiacente].add(nodo)

    root = sorgenti.pop()
    sorgenti.add(root)
    costo = 0

    visitati = {root}
    dfs(root)

    return root
