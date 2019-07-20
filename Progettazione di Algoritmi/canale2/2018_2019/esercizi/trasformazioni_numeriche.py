def trasformazioni_cammino(lista, origine, destinazione):
    def esiste_cammino_dfs(nodo):
        for adiacente in grafo[nodo]:
            if adiacente not in visitati:
                visitati.add(adiacente)

                if adiacente == destinazione:
                    return True

                if esiste_cammino_dfs(adiacente):
                    return True

        return False

    def genera_combinazioni(nodo):
        combinazioni = []

        for posizione in range(7): # numero da 7 cifre
            for cifra in range(9): # possibili valori per una cifra
                generato = list(nodo)

                if cifra != generato[posizione]:
                    generato[posizione] = str(cifra)
                    combinazioni.append("".join(generato))

        return combinazioni

    if origine == destinazione:
        return True

    # Conversione di tutto in stringhe:
    origine = str(origine)
    destinazione = str(destinazione)
    grafo = {str(nodo):[] for nodo in lista}

    # Generazione del grafo.
    for nodo in grafo:
        combinazioni = genera_combinazioni(nodo)

        # Max 63 combinazioni per nodo.
        for combinazione in combinazioni:
            if combinazione in grafo:
                # grafo non diretto.
                grafo[nodo].append(combinazione)
                grafo[combinazione].append(nodo)

    # Visita DFS.
    visitati = set()
    visitati.add(origine)
    return esiste_cammino_dfs(origine)
