def sottomatrice(M):
    '''
    Restituisce la dimensione massima della sottomatrice quadrata con tutti
    '1' in tempo O(n^2), dove n è la lunghezza di un lato della matrice.
    '''

    n = len(M)
    T = [[0 for _ in range(n)] for _ in range(n)]

    # Casi di contorno.
    for i in range(n):
        T[i][0] = M[i][0]
    for i in range(n):
        T[0][i] = M[0][i]

    # Regola generale.
    for i in range(1, n):
        for j in range(1, n):
            if not M[i][j]: # C'è uno '0'.
                T[i][j] = 0
            else: # C'è un '1'.
                T[i][j] = min(T[i][j - 1], T[i - 1][j - 1], T[i - 1][j]) + 1

    return max([max(row) for row in T])

if __name__ == "__main__":
    M = [[1, 0, 1, 1, 1],
         [1, 1, 1, 1, 1],
         [1, 1, 1, 0, 1],
         [1, 1, 1, 1, 1],
         [1, 1, 0, 1, 1]]

    print(sottomatrice(M))
    print("expected =", 3)
