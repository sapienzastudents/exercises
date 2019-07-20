def esaustivo(n, k):
    '''Stampa tutte le stringhe binarie di lunghezza n con al massimo k uni.'''
    def genera(cifre, uni):
        if len(cifre) == n: # foglia
            if uni <= k: # filtraggio
                print("".join(cifre))
        else: # nodo interno
            cifre.append("0")
            genera(cifre, uni)
            cifre.pop()

            cifre.append("1")
            genera(cifre, uni + 1)
            cifre.pop()

    if n >= 0:
        cifre = []
        genera(cifre, 0)

def stampaStringheBinarieMaxUni(n, k):
    '''Stampa tutte le stringhe binarie di lunghezza n con al massimo k uni.'''
    def genera(cifre, uni):
        if len(cifre) == n: # foglia
            print("".join(cifre))
        else: # nodo interno
            cifre.append("0")
            genera(cifre, uni) # lo 0 non aggiunge uni
            cifre.pop()

            if uni + 1 <= k: # funzione di taglio
                cifre.append("1")
                genera(cifre, uni + 1)
                cifre.pop()

    if n >= 0 and k >= 0 and k <= n:
        cifre = []
        genera(cifre, 0)

if __name__ == "__main__":
    from time import time

    start_esaustivo = time()
    esaustivo(24, 2)
    end_esaustivo = time()

    start_ottimo = time()
    stampaStringheBinarieMaxUni(24, 2)
    end_ottimo = time()

    print()
    print("Esaustivo:", end_esaustivo - start_esaustivo)
    print("Ottimo:", end_ottimo - start_ottimo)
