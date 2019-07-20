def stampaPermutazioni(n):
    '''Stampa tutte le permutazioni dei numeri da 0 a n - 1.'''
    def genera(cifre, utilizzate):
        if len(cifre) == n: # nodo foglia
            print(cifre)
        else: # nodo interno
            for i in range(n):
                # Se la cifra è già presente nella lista delle cifre la scarta.
                if i not in utilizzate:
                    utilizzate.add(i)
                    cifre.append(i)

                    genera(cifre, utilizzate)

                    cifre.pop()
                    utilizzate.remove(i)

    if n >= 0:
        cifre = []
        utilizzate = set()
        genera(cifre, utilizzate)
