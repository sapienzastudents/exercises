def es4(X, Y):
    n = len(X)
    m = len(Y)

    T = [[0 for _ in range(m + 1)] for _ in range(n + 1)]

    for i in range(1, n + 1):
        for j in range(1, m + 1):
            if X[i - 1] != Y[j - 1]: # Poichè T è sfasata di 1.
                T[i][j] = max(T[i - 1][j], T[i][j - 1])
            else:
                T[i][j] = T[i - 1][j - 1] + 1

    return T[n][m], es4_seq(X, Y, T)

def es4_seq(X, Y, T):
    seq = []
    pos_X = []
    pos_Y = []

    i = len(X)
    j = len(Y)

    while i > 0 and j > 0:
        # Ricordo che T è sfasata di 1 rispetto a X e Y.
        if X[i - 1] == Y[j - 1]:
            seq.append(X[i - 1])
            pos_X.append(i - 1)
            pos_Y.append(j - 1)

            i -= 1
            j -= 1
        else:
            if T[i][j] == T[i - 1][j]:
                i -= 1
            else:
                j -= 1

    seq.reverse()
    pos_X.reverse()
    pos_Y.reverse()

    return seq, pos_X, pos_Y
