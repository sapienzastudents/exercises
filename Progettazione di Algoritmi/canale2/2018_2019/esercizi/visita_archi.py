def cammino_archi(grafo):
    '''Restituisce un possibile cammino nel grafo che attraversa tutti gli archi
    una sola volta per ognuna delle due direzioni. Ha complessità O(m). Il grafo
    deve essere connesso e non diretto.'''

    # L'algoritmo funziona in questo modo: mi segno per ogni arco diretto se è
    # stato attraversato o meno. Faccio partire una DFS modificata da qualsiasi
    # nodo, e attraverso ogni arco segnato in entrambe le direzioni come libero.
    # Quando attraverso un arco segno la direzione come occupata, e vado in un
    # nodo in cui non ci sono archi liberi torno indietro nella ricorsione,
    # segnando gli archi al contrario.
    # Alla fine avrò un cammino che passa per tutti gli archi.

    def visita(nodo, padre):
        cammino.append(nodo) # andata ricorsione

        for adiacente in grafo[nodo]:
            # Evito di controllare l'arco con il padre e vedo se l'arco con
            # l'adiacente è libero per passarci.
            if adiacente != padre \
               and not archi[(nodo, adiacente)] \
               and not archi[(adiacente, nodo)]:
                archi[(nodo, adiacente)] = True
                visita(adiacente, nodo)

                cammino.append(nodo) # ritorno ricorsione

        # Prima di tornare indietro segno l'arco collegato con il padre.
        archi[(nodo, padre)] = True


    archi = { (nodo, adiacente): False for nodo in grafo
                                       for adiacente in grafo[nodo] }

    cammino = []

    visita(0, 0)

    return cammino
