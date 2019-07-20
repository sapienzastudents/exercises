def es7(n):
    if n < 2:
        return 0

    # Tassellamenti in rettangoli 3*n con tessere da 2*1.
    t = [0 for _ in range(0, n + 1)]

    # Tassellamenti in rettangoli 3*n con tessere da 2*1 con rettangoli a cui
    # manca un angolo.
    t_first = [0 for _ in range(0, n + 1)]

    t[0] = 1
    t[1] = 0
    t_first[1] = 1

    # Se n è dispari il tassellamento non è completo.
    if n % 2 != 0:
        return 0

    for i in range(2, n + 1):
        t[i] = t[i - 2] + 2 * t_first[i - 1]
        t_first[i] = t[i - 1] + t_first[i - 2]

    return t[n]
