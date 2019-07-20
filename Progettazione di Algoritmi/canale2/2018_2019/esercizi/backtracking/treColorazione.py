def treColorazione(grafo):
    '''Restituisce un 3-colorazione di un grafo se esiste, altrimenti una lista
    vuota.'''
    def genera(sol, nodo):
        # Se l'ultimo nodo è colorato si è trovata una colorazione completa.
        if nodo == len(grafo): # foglia
            return True
        else: # nodo interno
            # Trovo i colori ammissibili per il nuovo nodo.
            colori = {"r", "b", "v"}
            for adiacente in grafo[nodo]:
                colori.discard(sol[adiacente])

            for colore in colori: # Se non c'è nessuno non si può colorare.
                sol[nodo] = colore

                if genera(sol, nodo + 1):
                    return True

                sol[nodo] = "-"

    sol = ["-" for _ in range(len(grafo))]
    genera(sol, 0)
    return sol if sol[-1] != "-" else []
