def probabilità_monete(P, k):
    '''
    Restituisce la probabilità di avere 'k' teste in 'len(P)' monete
    taroccate. Ogni moneta ha una probabilità [0,1] di far uscire testa.
    '''
    # TODO: non funzionante

    n = len(P)
    # T[i][j] = probabilità di avere i teste con le prime j monete.
    T = [[0 for _ in range(k + 1)] for _ in range(n + 1)]

    for i in range(n + 1):
        for j in range(k + 1):
            if i == 0 and j == 0: # 0 teste e 0 monete
                T[i][j] = 1
            elif i == 0: # 0 teste
                T[i][j] = T[i][j - 1] * (1 - P[j - 1])
            elif j == 0: # 0 monete
                T[i][j] = 0
            else:
                # Probabilità che esca croce e che esca testa.
                T[i][j] = T[i][j - 1] * (1 - P[j - 1]) + T[i - 1][j - 1] * P[j - 1]

    return T[n][k] / pow_n(2, n)

def pow_n(base, n):
    '''Restituisce il numero base^n in tempo O(log n).'''
    if n == 1: # base^1 = base
        return base

    if n % 2 == 0: # n pari
        result = pow_n(base, n // 2)
        return result * result # base^n = base^n/2 * base^n/2
    else: # n dispari
        result = pow_n(base, (n - 1)// 2)
        return base * result * result # base^n = base * base^n/2 * base^n/2
