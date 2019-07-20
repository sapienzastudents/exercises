def nodi_albero_grado(k, padri):
    # Passo 1: trovo la radice.
    radice = 0
    for nodo in range(len(padri)):
        if padri[nodo] == nodo:
            radice = nodo

    # Passo 2: calcolo i gradi.
    gradi = [0 for _ in padri]
    for nodo in range(len(padri)):
        gradi[nodo] += 1
        gradi[padri[nodo]] += 1

    # Perchè:
    #   - la radice compare come padre di se stessa.
    #   - la radice non ha un padre, quindi non deve essere contate la sua
    #     posizione nel vettore (al contrario dei nodi interni e delle foglie).
    gradi[radice] -= 2

    # Passo 3: trovo i nodi con grado k.
    nodi = set()
    for nodo in range(len(gradi)):
        if gradi[nodo] == k:
            nodi.add(nodo)

    return nodi
