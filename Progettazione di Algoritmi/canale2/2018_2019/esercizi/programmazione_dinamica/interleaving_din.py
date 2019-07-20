def interleaving_din_tag(x, y, z):
    '''
    Se 'z' è un rimescolamento di 'x' e 'y', allora restituisce una lista in
    cui è segnato per ogni elemento in 'z' in quale sequenza appartiene ('x' o
    'y').
    '''

    n, m = len(x), len(y)
    T = [[False for _ in range(n + 1)] for _ in range(m + 1)]
    T[0][0] = True

    # Casi base. Notare che la matrice è sfasata di 1 rispetto a z, y e x.
    for i in range(1, m + 1):
        T[i][0] = T[i - 1][0] and x[i - 1] == z[i - 1]
    for j in range(1, m + 1):
        T[0][j] = T[0][j - 1] and y[j - 1] == z[j - 1]

    for i in range(1, n + 1):
        for j in range(1, m + 1):
            # L'ordine degli if è importante!

            # Poichè lo stesso simbolo posso assegnarlo sia a x che y, vedo ai
            # passi precedenti quali dei due porta alla soluzione (anche
            # entrambi).
            if x[i - 1] == z[i + j - 1] and y[j - 1] == z[i + j - 1]:
                T[i][j] = T[i][j - 1] or T[i - 1][j]

            # Posso assefnare il simbolo solo a x, ma devo vedere se al passo
            # precedente ho un mischiamento corretto.
            elif x[i - 1] == z[i + j - 1]:
                T[i][j] = T[i - 1][j]
            elif y[j - 1] == z[i + j - 1]:
                T[i][j] = T[i][j - 1]
            # Non posso assegnare nulla (la matrice è già a False in default).
            # else:
            #     T[i][j] = False

    if T[n][m] == False:
        return []

    tag = []
    i, j = n, m
    while len(tag) < n + m:
        if T[i - 1][j]:
            tag.append('x')
            i -= 1
        else:
            tag.append('y')
            j -= 1

    tag.reverse()
    return ''.join(tag)
