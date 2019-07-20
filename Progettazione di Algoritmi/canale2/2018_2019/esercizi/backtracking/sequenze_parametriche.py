def sequenze_parametriche(n, m, k):
    '''
    Presi i tre interi n, m e k, stampa tutte le sequenze di n interi positivi
    con interi di valore al più m e nelle quali nessun intero compare più di k
    volte.

    Ad esempio per n = 3, m = 2 e k = 2 le sequenze da stampare sono:

    [1, 1, 2] [1, 2, 1] [2, 1, 1] [1, 2, 2] [2, 1, 2] [1, 2, 2]

    L'algoritmo deve avere complessità O(nS(n)) dove S(n) è il numero di
    sequenza da stampare.
    '''

    def genera(count = {}, sol = []):
        nonlocal interni, foglie # TEST
        if len(sol) == n:
            foglie += 1 # TEST
            print(sol)
        else:
            interni += 1 # TEST

            for i in range(1, m + 1):
                if i not in count:
                    count[i] = 0

                if count[i] < k:
                    count[i] += 1
                    sol.append(i)
                    genera()
                    sol.pop()
                    count[i] -= 1

    foglie = 0 # TEST
    interni = 0 # TEST
    genera()
    return interni, foglie # TEST
