def direziona(grafo):
    '''Restituisce una copia del grafo non diretto con gli archi direzionati in
    modo da avere un grafo diretto aciclico. Lo esegue in tempo O(n + m).'''

    diretto = {nodo:[] for nodo in grafo}

    for nodo in grafo:
        for adiacente in grafo[nodo]:
            # Non perdo nessun arco perchè analizzo ogni nodo, quindi il caso
            # "nodo > adiacente" verrà catturato da "adiacente".
            if nodo < adiacente:
                diretto[nodo].append(adiacente)

    return diretto
