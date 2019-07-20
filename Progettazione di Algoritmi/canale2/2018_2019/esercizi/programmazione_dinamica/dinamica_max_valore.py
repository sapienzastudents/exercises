def es4(lista):
    n = len(lista)

    T = [0 for _ in range(n)] # Tabella di supporto
    T[0] = lista[0]
    max_index = 0

    for i in range(1, n):
        T[i] = max(lista[i], T[i - 1] + lista[i])
        max_index = max_index if T[max_index] >= T[i] else i

    # Ricostruisco la tupla.
    sum_value = lista[max_index]
    left_index = max_index
    while sum_value != T[max_index]:
        left_index -= 1
        sum_value += lista[left_index]

    return sum_value, (left_index, max_index)
