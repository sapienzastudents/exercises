def m_lista(M):
    '''
    Restituisce il valore e la M lista con valore minimo della matrice M in
    tempo O(n * m), ossia le dimensioni della matrice. Una M lista è una
    sequenza (M[1][j1], M[2][j2], ..., M[n][jn]) per cui 1 <= j1 <= j2 <= ... <=
    jn. Il valore è semplicemente la somma degli elementi.
    '''
    n = len(M)
    m = len(M[0])
    T = [[0 for _ in range(m)] for _ in range(n)]

    # Casi di contorno.
    for i in range(m):
        T[0][i] = M[0][i]
    for i in range(1, n):
        T[i][0] = T[i - 1][0] + M[i][0]

    # Regola generale.
    for i in range(1, n):
        for j in range(m):
            T[i][j] = min(T[i - 1][j - 1], T[i - 1][j]) + M[i][j]

    # Ricostruzione della m-lista.
    value, j = min([(T[n - 1][i], i) for i in range(m)])
    m_list = []

    for i in range(n - 1, -1, -1): # dalla fine all'inizio
        m_list.append(M[i][j])
        j = j if T[i - 1][j] == T[i][j] - M[i][j] else j - 1

    m_list.reverse()
    return value, m_list

if __name__ == "__main__":
    # Riguardo questa matrice la soluzione è 7, ossia la m-lista [1, 2, 1, 2, 1].
    # Notare che in questo caso è indifferente alla terza riga quale "1" si
    # sceglie.
    M = [[1, 3, 5, 7, 4, 3],
         [2, 3, 5, 7, 2, 7],
         [1, 1, 0, 8, 9, 2],
         [8, 2, 4, 3, 7, 8],
         [4, 6, 1, 7, 5, 7]]

    print(m_lista(M))
    print("expected = (7, [1, 2, 1, 2, 1])")

