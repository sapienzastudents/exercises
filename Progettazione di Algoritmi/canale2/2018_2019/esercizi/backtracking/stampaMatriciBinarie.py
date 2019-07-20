def stampaMatriciBinarie(n):

    def genera(matrice, ultimaRiga, ultimaColonna):
        # Se non mi fermo sforo nella matrice. Significa che ho riempito tutte
        # le n - 1 righe.
        if ultimaRiga == n:
            print()
            for riga in range(len(matrice)):
                print(matrice[riga])
        else:
            matrice[ultimaRiga][ultimaColonna] = 0

            if ultimaColonna + 1 < n: # Vado avanti nella colonna.
                genera(matrice, ultimaRiga, ultimaColonna + 1)
            else: # Nuova riga.
                genera(matrice, ultimaRiga + 1, 0)

            matrice[ultimaRiga][ultimaColonna] = 1
            if ultimaColonna + 1 < n: # Vado avanti nella colonna.
                genera(matrice, ultimaRiga, ultimaColonna + 1)
            else: # Nuova riga
                genera(matrice, ultimaRiga + 1, 0)

    if n >= 0:
        matrice = [[0 for _ in range(n)] for _ in range(n)]
        genera(matrice, 0, 0)
