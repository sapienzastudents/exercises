def esaustivo(cap, pesi, valori):
    def genera(sol):
        nonlocal sol_ottima, val_ottimo, nodi

        if len(sol) == len(pesi): # foglia
            # Controllo se è ammissibile.
            if sum([pesi[i] if sol[i] else 0 for i in range(len(pesi))]) < cap:
                # Controllo se è migliore.
                val = sum([valori[i] if sol[i] else 0 for i in range(len(pesi))])
                if val > val_ottimo:
                    val_ottimo = val
                    sol_ottima = sol.copy()
        else: # nodo interno
            nodi += 1
            sol.append(0)
            genera(sol) # Provo a vedere se non lo aggiungo.
            sol.pop()

            sol.append(1)
            genera(sol) # Provo a vedere se lo aggiungo
            sol.pop()


    sol_ottima = [0 for _ in range(len(pesi))]
    val_ottimo = -1
    nodi = 0
    genera([])
    return sol_ottima, val_ottimo, nodi

def unTaglio(cap, pesi, valori):
    def genera(sol, pesoTot):
        nonlocal sol_ottima, val_ottimo, nodi

        if len(sol) == len(pesi): # foglia
            # Controllo se è migliore.
            val = sum([valori[i] if sol[i] else 0 for i in range(len(pesi))])
            if val > val_ottimo:
                val_ottimo = val
                sol_ottima = sol.copy()
        else: # nodo interno
            nodi += 1
            sol.append(0)
            genera(sol, pesoTot) # Provo a vedere se non lo aggiungo.
            sol.pop()

            # Se posso aggiungerlo senza sforare provo.
            if pesoTot + pesi[len(sol)] < cap:
                sol.append(1)
                genera(sol, pesoTot + pesi[len(sol) - 1])
                sol.pop()


    sol_ottima = [0 for _ in range(len(pesi))]
    val_ottimo = -1
    nodi = 0
    genera([], 0)
    return sol_ottima, val_ottimo, nodi

def dueTagli(cap, pesi, valori):
    def genera(sol, pesoTot, valAttuale, valRimanente):
        nonlocal sol_ottima, val_ottimo, nodi

        if len(sol) == len(pesi): # foglia
            if valAttuale > val_ottimo:
                val_ottimo = valAttuale
                sol_ottima = sol.copy()
        else: # nodo interno
            nodi += 1

            nodo = len(sol)

            # Se non lo aggiungo e ipotizzando che prendo tutti i rimanenti,
            # quanto ci perdo?
            if valAttuale + valRimanente - valori[nodo] > val_ottimo:
                sol.append(0)
                genera(sol, pesoTot, valAttuale, valRimanente - valori[nodo])
                sol.pop()

            # Se posso aggiungerlo senza sforare provo.
            if pesoTot + pesi[len(sol)] < cap:
                sol.append(1)
                genera(sol, pesoTot + pesi[nodo], valAttuale + valori[nodo],
                       valRimanente - valori[nodo])
                sol.pop()


    sol_ottima = [0 for _ in range(len(pesi))]
    val_ottimo = -1
    nodi = 0
    genera([], 0, 0, sum(valori))
    return sol_ottima, val_ottimo, nodi
