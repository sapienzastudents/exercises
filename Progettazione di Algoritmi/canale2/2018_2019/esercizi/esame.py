# Progett. alg. intero positivo n, stampa tutte le stringhe ternarie {0,1,2} in
# cui non compare mai 02 e 20.
# Es. n = 3 ci sono 3 * 3 * 3 stringhe = 27
def es1(n):
    def genera(num):
        nonlocal total
        if len(num) == n:
            total += 1
        else:
            values = {"0", "1", "2"}

            if num[-1] == "0":
                values.remove("2")
            elif num[-1] == "2":
                values.remove("0")

            for i in values:
                num.append(i)
                genera(num)
                num.pop()

    total = 0
    num = []

    for i in {"0", "1", "2"}:
        num.append(i)
        genera(num)
        num.pop()

    return total

# stesso problema con la prog. dinamica
def es2(n):
    # t[i][j] = numero di stringhe lunghe j che terminano con i
    T = [[0 for _ in range(n)] for _ in range(3)]

    T[0][0] = 1
    T[1][0] = 1
    T[2][0] = 1

    for i in range(1, n):
        # Se aggiungo 0 devo stare attento a un eventuale 2 precedente.
        T[0][i] = T[0][i - 1] + T[1][i - 1]

        # Se aggiungo 1 non ci sono problemi
        T[1][i] = T[0][i - 1] + T[1][i - 1] + T[2][i - 1]

        # Se aggiungo 2 devo stare attento a un eventuale 0 precedente.
        T[2][i] = T[1][i - 1] + T[2][i - 1]

    return T[0][i - 1] + T[1][i - 1] + T[2][i - 1]
