def es5(sequenza):
    n = len(sequenza)
    T = [0 for _ in range(n)]
    T[0] = 1
    max_index = 0

    for i in range(1, n):
        T[i] = max([T[j] for j in range(0, i) if sequenza[j] < sequenza[i]],
                   default = 0) + 1
        max_index = max_index if T[max_index] >= T[i] else i

    # Ricostruisco la sequenza.
    nuova_sequenza = ["_" for _ in range(n)]
    length_seq = T[max_index]
    last_index = max_index
    while length_seq > 0:
        nuova_sequenza[last_index] = sequenza[last_index]
        length_seq -= 1

        if length_seq > 0:
            left_index = last_index - 1

            while sequenza[left_index] > sequenza[last_index] \
                  or T[left_index] != length_seq:
                left_index -= 1

            last_index = left_index

    return nuova_sequenza

