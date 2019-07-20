def orienta(grafo):
    # Grado parzialmente orientato aciclico.
    ordine = []

    gradi = [0 for _ in grafo]
    for nodo in grafo:
        for adiacente in grafo[nodo][0]: # archi diretti
            gradi[adiacente] += 1

    sorgenti = {nodo for nodo in grafo if gradi[nodo] == 0}
    while sorgenti:
        nodo = sorgenti.pop()
        ordine.append(nodo)

        for adiacente in grafo[nodo][1]: # archi non diretti
            if nodo not in grafo[adiacente][0]: # se non è stato già direzionato
                grafo[nodo][0].append(adiacente) # nodo -> adiacente

            gradi[adiacente] += 1

        for adiacente in grafo[nodo][0]: # archi diretti
            gradi[adiacente] -= 1
            if gradi[adiacente] == 0:
                sorgenti.add(adiacente)


    return {nodo: grafo[nodo][0] for nodo in grafo}



