def regioni_rosse(lista):
    def intersezione(nodo, check):
        '''Restituisce vero se 'nodo' e 'check' si intersecano'''
        (x, y), base, altezza = nodo
        (x_check, y_check), base_check, altezza_check = check

        return (y + altezza) >= y_check \
               and y <= (y_check + altezza_check) \
               and (x + base) >= x \
               and x <= (x_check + base_check)

    def dfs(nodo):
        for adiacente in grafo[nodo]:
            if componenti[adiacente] == -1:
                componenti[adiacente] = componenti[nodo]
                dfs(adiacente)

    grafo = {nodo:[] for nodo in lista}

    # Creazione del grafo.
    for nodo in grafo:
        for check in grafo:
            if check != nodo:
                if intersezione(nodo, check):
                    grafo[nodo].append(check)
                    grafo[check].append(nodo)

    # -1 -> nessuna componente assegnata
    componenti = {nodo:-1 for nodo in lista}
    ultima_comp = -1

    for nodo in grafo:
        if componenti[nodo] == -1:
            ultima_comp += 1
            componenti[nodo] = ultima_comp
            dfs(nodo)

    return len(set(componenti.values()))
