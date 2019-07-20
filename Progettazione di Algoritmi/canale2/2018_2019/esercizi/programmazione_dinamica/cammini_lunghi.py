def es2(M):
    def es2_in(i, j):
        if T[i][j] != 0:
            return T[i][j]

        v = M[i][j] + 1

        if j + 1 < n and M[i][j + 1] == v:
            T[i][j] = 1 + es2_in(i, j + 1)
            return T[i][j]

        if i + 1 < n and M[i + 1][j] == v:
            T[i][j] = 1 + es2_in(i + 1, j)
            return T[i][j]

        if j > 0 and M[i][j - 1] == v:
            T[i][j] = 1 + es2_in(i, j - 1)
            return T[i][j]

        if i > 0 and M[i - 1][j] == v:
            T[i][j] = 1 + es2_in(i - 1, j)
            return T[i][j]

        T[i][j] = 1
        return T[i][j]

    n = len(M)
    T = [[0 for _ in range(n)] for _ in range(n)]

    value = max([es2_in(i, j) for i in range(n) for j in range(n)])

    return value, es2_seq(M, T)

def es2_seq(M, T):
    def seq_in(i, j):
        seq.append(M[i][j])

        v = M[i][j] + 1

        if j + 1 < n and M[i][j + 1] == v:
            return seq_in(i, j + 1)

        if i + 1 < n and M[i + 1][j] == v:
            return seq_in(i + 1, j)

        if j > 0 and M[i][j - 1] == v:
            seq_in(i, j - 1)

        if i > 0 and M[i - 1][j] == v:
            seq_in(i - 1, j)

    n = len(M)

    # Trovo la cella con tale valore 'max_value'.
    (i, j) = max([(T[i][j], (i, j)) for i in range(n) for j in range(n)])[1]

    # Uso la riccorrenza al contrario.
    seq = []

    seq_in(i, j)

    return seq
