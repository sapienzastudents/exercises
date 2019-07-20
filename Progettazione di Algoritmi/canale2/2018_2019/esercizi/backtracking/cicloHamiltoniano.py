def cicloHamiltoniano(grafo):
    def genera(ciclo, nodiCiclo):
        ultimoNodo = ciclo[-1] # Ultimo nodo aggiunto
        if len(ciclo) == len(grafo): # nodo foglia
            if 0 in grafo[ultimoNodo]: # Se si chiude il ciclo
                return True
        else: # nodo interno
            for adiacente in grafo[ultimoNodo]:
                if adiacente not in nodiCiclo:
                    nodiCiclo.add(adiacente)
                    ciclo.append(adiacente)

                    if genera(ciclo, nodiCiclo):
                        return True

                    ciclo.pop()
                    nodiCiclo.remove(adiacente)


    ciclo = [0]
    nodiCiclo = {0}
    genera(ciclo, nodiCiclo)
    return ciclo if len(ciclo) == len(grafo) else []
