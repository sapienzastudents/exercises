from collections import deque

def padri_sottoalbero(padri, x):
    def bfs(partenza):
        '''Restituisce l'insieme dei nodi raggiungibili dal nodo 'partenza' nel
        sottoalbero di tale nodo, compreso esso stesso.'''
        nodi = {partenza}

        coda = deque()
        coda.append(partenza)

        while coda:
            nodo = coda.popleft()

            for adiacente in grafo[nodo]:
                if adiacente not in nodi:
                    nodi.add(adiacente)
                    coda.append(adiacente)

        return nodi

    def conversion():
        '''Restituisce un grafo corrispondende al vettore dei padri. Tale grafo
        è composto da due componenti diverse, una con radice x e l'altra con
        radice del vettore originale.

        Se x corrisponde alla radice del vettore originale c'è solamente una
        componente connessa.'''
        grafo = {nodo:[] for nodo in range(len(padri))}

        for nodo in range(len(padri)):
            # Il motivo è che devo staccare il grafo da x (notare che se x è
            # radice non cambia nulla), così da fare una visita da x senza la
            # paura di risalire sopra.
            if nodo != x:
                grafo[nodo].append(padri[nodo])
                grafo[padri[nodo]].append(nodo)

        return grafo


    grafo = conversion()
    return bfs(x)
