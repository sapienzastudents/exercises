def esaustivo(n):
    '''Stampa tutte le permutazioni dei numeri da 0 a n - 1 con numeri pari
    nelle posizioni pari.'''

    def check(cifre):
        for i in range(len(cifre)):
            if not i % 2 and cifre[i] % 2:
                return False
        return True

    def genera(cifre, utilizzate):
        if len(cifre) == n: # nodo foglia
            if check(cifre):
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

def stampaPermutazioniNumPari(n):
    '''Stampa tutte le permutazioni dei numeri da 0 a n - 1 con numeri pari
    nelle posizioni pari.'''

    def genera(cifre, utilizzate):
        if len(cifre) == n: # nodo foglia
            print(cifre)
        else: # nodo interno
            for i in range(n):
                # Se la cifra è già presente nella lista delle cifre la scarta.
                # Inoltre se l'indice è pari anche la cifra deve esserlo.
                if i not in utilizzate and len(cifre) % 2 == i % 2:
                    utilizzate.add(i)
                    cifre.append(i)

                    genera(cifre, utilizzate)

                    cifre.pop()
                    utilizzate.remove(i)

    if n >= 0:
        cifre = []
        utilizzate = set()
        genera(cifre, utilizzate)

if __name__ == "__main__":
    from time import time

    start_esaustivo = time()
    esaustivo(10)
    end_esaustivo = time()

    start_ottimo = time()
    stampaPermutazioniNumPari(10)
    end_ottimo = time()

    print()
    print("Esaustivo:", end_esaustivo - start_esaustivo)
    print("Ottimo:", end_ottimo - start_ottimo)
