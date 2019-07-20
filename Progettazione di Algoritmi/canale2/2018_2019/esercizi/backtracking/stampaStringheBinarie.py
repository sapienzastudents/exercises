def stampaStringheBinarie(n):
    '''Stampa tutte le stringhe binarie di lunghezza n.'''
    def genera(cifre):
        if len(cifre) == n: # foglia
            print("".join(cifre))
        else: # nodo interno
            cifre.append("0")
            genera(cifre)
            cifre.pop()

            cifre.append("1")
            genera(cifre)
            cifre.pop()

    if n >= 0:
        cifre = []
        genera(cifre)
