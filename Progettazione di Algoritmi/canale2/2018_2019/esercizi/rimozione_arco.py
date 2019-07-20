from collections import deque

def rimozione_arco(grafo, nodo, padri, arco):
    src, dst = arco

    def distanza(nodo, padri):
        '''Restituisce la distanza dal nodo 'nodo' alla radice del vettore dei
        padri 'padri', che deve essere necessariamente una BFS. Il costo è di
        O(n).'''

        if padri[nodo] == nodo:
            return 0

        return 1 + distanza(padri[nodo], padri)

    def partial_bfs(distanza, nodo, grafo):
        '''Restituisce l'insieme dei nodi a distanza 'distanza' da 'nodo' nel
        grafo 'grafo', ossia è una BFS parziale. Tempo O(n + m).'''

        distanze = [-1 for nodo in grafo]
        distanze[nodo] = 0

        coda = deque([nodo])

        nodi = set()

        while coda:
            nodo = coda.popleft()

            for adiacente in grafo[nodo]:
                if distanze[adiacente] == -1:
                    distanze[adiacente] = distanze[nodo] + 1

                    # Se il nodo è quello a distanza giusta lo prendo, senza
                    # proseguire per la sua BFS.
                    if distanze[adiacente] == distanza:
                        nodi.add(adiacente)
                    else:
                        coda.append(adiacente)

        return nodi

    # Se l'arco (src, dst) non è presente nella BFS nel vettore dei padri allora
    # la rimozione di tale arco non modifica le distanze di nodo.
    if padri[dst] != src:
        return True

    # Mi ricavo la distanza da src alla radice del vettore dei padri, ossia
    # nodo.
    distanza_src = distanza(src, padri)

    # Prendo tutti i nodi che sono a distanza da nodo uguale a quella di src.
    nodi = partial_bfs(distanza_src, nodo, grafo)
    nodi.remove(src)

    # Fra i nodi dello stesso livello vedo se dst è presente come adiacente. Se
    # sì allora la rimozione dell'arco non modifica le distanze, altrimenti le
    # modifica eccome!
    for nodo in nodi:
        if dst in grafo[nodo]:
            return True

    return False
