def regine(n):
    '''
    Restituisce il numero di modi diversi di posizionare 'n' regine in una
    scacchiera d nxn, per cui in regina non può cattuare un'altra e viceversa.
    '''

    def genera(riga = 0):
        if riga == n: # nodo foglia.
            return 1
        else: # nodo interno.
            total = 0

            for colonna in range(n): # tutte le possibili colonne.
                # Se la colonna è stata già presa, oppure occupa una diagonale
                # già presa da un'altra regina, allora va avanti e salta.
                if colonna not in colonnePrese \
                        and (riga + colonna) not in primaDiagonalePresa \
                        and (riga - colonna) not in secondaDiagonalePresa:
                    colonnePrese.add(colonna)
                    primaDiagonalePresa.add(riga + colonna)
                    secondaDiagonalePresa.add(riga - colonna)
                    disposizione[riga] = colonna

                    total += genera(riga + 1)

                    secondaDiagonalePresa.remove(riga - colonna)
                    primaDiagonalePresa.remove(riga + colonna)
                    colonnePrese.remove(colonna)

            return total

    if n >= 0:
        colonnePrese = set()
        primaDiagonalePresa = set()
        secondaDiagonalePresa = set()
        disposizione = [0 for _ in range(n)]

        return genera()
    else:
        return -1
