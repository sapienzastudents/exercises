def es3(V, P, C):
    # V -> Lista dei valori degli oggetti
    # P -> Lista dei pesi degli oggetti
    # C -> Capacità massima dello zaino

    n_oggetti = len(V)
    T = [[0 for _ in range(C + 1)] for _ in range(n_oggetti + 1)]

    for i in range(1, n_oggetti + 1):
        for c in range(1, C + 1):
            # Quando mi riferisco a V e P, devo fare -1 poichè la tabella è
            # sfasata di 1.
            if P[i - 1] > c:
                T[i][c] = T[i - 1][c]
            else:
                T[i][c] = max(T[i - 1][c], V[i - 1] + T[i - 1][c - P[i - 1]])

    return T[n_oggetti][C], es3_sott(V, P, C, T)

def es3_sott(V, P, C, T):
    sott = set()

    i = len(V)

    while i > 0:
        if T[i][C] > T[i - 1][C]:
            sott.add(i)
            C -= P[i - 1]
        i -= 1

    return sott
