def bicolorazione(grafo):
    # Grafo connesso e non diretto.

    def dfs(nodo):
        for adiacente in grafo[nodo]:
            if colorazione[adiacente] == colorazione[nodo]:
                return False

            if colorazione[adiacente] == 0:
                colorazione[adiacente] = 1 if colorazione[nodo] == 2 else 2

                if not dfs(adiacente):
                    return False

        return True

    # Vettore delle colorazioni, i valori sono:
    # 0: non visitato
    # 1: primo colore
    # 2: secondo colore
    colorazione = [0 for _ in grafo]

    colorazione[0] = 1

    return colorazione if dfs(0) else []
