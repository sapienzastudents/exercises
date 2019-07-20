from collections import deque

def cammino(a, b, grafo):
    def raggiungibili(nodo, grafo):
        '''Dato un nodo e un grafo, restituisce l'insieme dei nodi raggiunti da
        tale nodo.'''
        raggiunti = set()

        coda = deque()
        coda.append(nodo)

        while coda:
            nodo = coda.popleft()
            raggiunti.add(nodo)

            for adiacente in grafo[nodo]:
                if adiacente not in raggiunti and adiacente not in coda:
                    coda.append(adiacente)

        return raggiunti

    def bfs(nodo, grafo):
        '''Restituisce il vettore delle distanze esplorando il grafo con una
        DFS.'''
        # Ogni nodo può avere valore:
        #       = 0 - è il nodo da cui è partita la BFS;
        #       < 0 - il nodo non è raggiungibile;
        #       > 0 - il nodo è raggiungibile con questi passi.
        distanze = [-1 for nodo in grafo]
        distanze[nodo] = 0

        visitati = [False for nodo in grafo]

        coda = deque()
        coda.append(nodo)

        while coda:
            nodo = coda.popleft()

            for adiacente in grafo[nodo]:
                if distanze[adiacente] == -1:
                    coda.append(adiacente)
                    distanze[adiacente] = distanze[nodo] + 1

        return distanze

    # Suddivido gli archi in rossi e neri, così da calcolarmi le componenti
    # connesse nere.
    grafo_rosso = {nodo:[] for nodo in grafo}
    grafo_nero = {nodo:[] for nodo in grafo}

    for nodo in grafo:
        for adiacente, colore in grafo[nodo]:
            if colore == 0:
                grafo_nero[nodo].append(adiacente)
            else:
                grafo_rosso[nodo].append(adiacente)

    # Calcolo le componenti connesse nere. Mi serve sia un grafo sia il
    # riferimento per ogni nodo.
    grafo_componenti = {0 : set()}
    nodi_componenti = [-1 for nodo in grafo]

    for nodo in raggiungibili(0, grafo_nero):
        nodi_componenti[nodo] = 0

    nodi = {nodo for nodo in grafo if nodi_componenti[nodo] == -1}
    i = 0
    while nodi:
        i += 1

        grafo_componenti[i] = set()

        for nodo in raggiungibili(nodi.pop(), grafo_nero):
            nodi.discard(nodo) # escludo tale nodo dal calcolo delle comp.
            nodi_componenti[nodo] = i

    # Il grafo delle componenti è sconnesso, devo popolarlo con gli archi rossi.
    for nodo in grafo:
        componente_nodo = nodi_componenti[nodo]
        for adiacente in grafo_rosso[nodo]:
            componente_adiacente = nodi_componenti[adiacente]

            if componente_nodo != componente_adiacente:
                grafo_componenti[componente_nodo].add(componente_adiacente)

    distanze = bfs(nodi_componenti[a], grafo_componenti)

    return distanze[nodi_componenti[b]]
