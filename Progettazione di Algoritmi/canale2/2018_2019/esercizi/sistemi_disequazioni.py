def disequazioni(lista):
    def conversion():
        '''Restituisce il grafo convertito e il dizionario dei gradi per ogni
           nodo entranti'''
        grafo = {}
        gradi = {}

        for first, relation, second in lista:
            if relation == ">":
                grafo.setdefault(first, [])
                grafo.setdefault(second, [])
                grafo[first].append(second)

                gradi.setdefault(second, 0)
                gradi[second] += 1
                gradi.setdefault(first, 0)
            else:
                grafo.setdefault(second, [])
                grafo.setdefault(first, [])
                grafo[second].append(first)

                gradi.setdefault(first, 0)
                gradi[first] += 1
                gradi.setdefault(second, 0)

        return grafo, gradi

    def sortTopologico():
        '''Restituisce il sort al contrario'''
        ordine = []

        sorgenti = {nodo for nodo in grafo if gradi[nodo] == 0}
        while sorgenti:
            nodo = sorgenti.pop()
            ordine.append(nodo)

            for adiacente in grafo[nodo]:
                gradi[adiacente] -= 1
                if gradi[adiacente] == 0:
                    sorgenti.add(adiacente)

        # Così ho il sort al contrario, è più facile poi assegnare i valori.
        ordine.reverse()

        # Il grafo può non essere un DAG.
        return ordine if len(ordine) == len(grafo) else []

    grafo, gradi = conversion()
    ordine = sortTopologico()

    if not ordine:
        return []

    # Poichè il sort è al contrario assegno dei valori crescenti.
    soluzione = [0 for _ in grafo]
    valore = 1
    for nodo in ordine:
        soluzione[nodo] = valore
        valore += 1

    return soluzione
