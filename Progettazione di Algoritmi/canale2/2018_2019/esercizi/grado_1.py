def grado_1(padri):
    gradi = [0 for _ in padri]

    for nodo in range(len(padri)):
        if nodo != padri[nodo]: # salto la radice
            gradi[nodo] += 1
            gradi[padri[nodo]] += 1

    return [nodo for nodo in range(len(gradi)) if gradi[nodo] == 1]
