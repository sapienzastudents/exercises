# Esercizio: dato un grafo G diretto e un nodo s, restituisce un ciclo se
# esiste.
#
# Soluzione: effetto una dfs tenendo conto di due insiemi, uno dei nodi attivi
# (ossia in cui la dfs sta ancora esplorando) e uno dei nodi visitati (per
# distinguere i nodi toccati o meno dalla dfs). Quando nella dfs tocco un nodo
# attivo, allora ho trovato un arco all'indietro. A questo punto tornando
# indietro nella ricorsione aggiungo in una lista i nodi del ciclo, finchè non
# raggiungo il "tappo", che è il noto attivo che avevo toccato e che ha
# scatenato il ritorno della ricorsione.
# Alla fine opzionalmente si può fare il reverse della lista, poichè la
# ricorsione produce il ciclo al contrario.

def grafi_stampa_ciclo(grafo, nodo):
    '''Restituisce un ciclo presente nel grafo DIRETTO, se esiste.'''
    def dfs(nodo):
        nonlocal tappo
        nodi_attivi.add(nodo)
        nodi_visitati.add(nodo)

        for adj in grafo[nodo]:
            # se il nodo ha come vicino un nodo ancora attivo, significa che ho
            # trovato un arco all'indietro.
            if adj in nodi_attivi:
                ciclo.append(nodo)
                tappo = adj
                return True

            # Il nodo non è stato mai visitato.
            if adj not in nodi_visitati:
                if dfs(adj):
                    ciclo.append(nodo)
                    return not tappo == nodo

        nodi_attivi.remove(nodo)

        return False

    nodi_attivi = set() # nodi per cui la dfs è attiva.
    nodi_visitati = set() # nodi toccati dalla dfs

    tappo = -1 # nodo puntato dall'arco all'indietro, se esiste
    ciclo = [] # dove salvare il ciclo
    dfs(nodo)
    ciclo.reverse() # opzionale
    return ciclo

def ciclo_non_diretto(grafo, nodo):
    '''Restituisce un ciclo presente nel grafo NON DIRETTO, se esiste.'''

    def dfs(nodo):
        nonlocal tappo
        for adj in grafo[nodo]:
            if padri[adj] == -1: # Nodo non visitato
                padri[adj] = nodo
                if dfs(adj):
                    ciclo.append(nodo)
                    return not tappo == nodo

            # Se il padre di nodo non è adj, significa che c'è un ciclo,
            # altrimenti significava il collegamento fra padre-figlio.
            elif padri[nodo] != adj:
                ciclo.append(nodo)
                tappo = adj
                return True

        return False

    tappo, ciclo = -1, []
    padri = [-1 for _ in range(len(grafo))]
    padri[nodo] = nodo
    dfs(nodo)
    ciclo.reverse()
    return ciclo
