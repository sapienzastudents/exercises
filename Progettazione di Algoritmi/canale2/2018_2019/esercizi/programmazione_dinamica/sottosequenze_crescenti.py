# Si consideri una sequenza di interi X . La cancellazione da X di un certo numero
# di elementi determina una sottosequenza. La sottosequenza è crescente se il
# valore dei suoi elementi è crescente. La lunghezza della sottosequenza è il numero
# di elementi che la compongono. Il valore della sottosequenza è dato dalla somma
# dei valori degli elementi che la compongono.
# Data la sequenza X = (x 1 , x 2 , . . . x n ) a valori distinti si considerino i seguenti
# tre problemi:
# a. Trovare la sottosequenza crescente di X di lunghezza massima.
# Ad esempio per X = (50, 4, 1002, 48, 3, 34, 30) la sottosequenza crescente
# di lunghezza massima è (2, 3, 34).
# b. Trovare la sottosequenza crescente di X di valore massimo.
# Ad esempio per X = (50, 2, 100, 1, 20, 30) la sottosequenza crescente di
# valore massimo è (50, 100).
# c. Trovare il numero delle sottosequenze crescenti di X .
# Ad esempio per X = (5, 3, 7, 8, 6) il numero di sottosequenze crescenti
# è 14 (le sottosequenze sono: (5), (5, 7), (5, 7, 8), (5, 8), (5, 6), (3), (3, 7),
# (3, 7, 8), (3, 8), (3, 6), (7), (7, 8), (8), (6).
# c. Dato l’intero k, con k  n, trovare il numero delle sottosequenze crescenti di
# X .
# Ad esempio per k = 2 e X = (5, 3, 7, 8, 6) il numero di sottosequenze è 7
# (le sottosequenze sono: (5, 7), (5, 8), (5, 6), (3, 7), (3, 8), (3, 6), (7, 8)).
# Progettare quattro algoritmi che risolvono i quattro problemi. La complessità
# dei primi tre algoritmi deve essere O(n 2 ), la complessità del quarto deve essere
# O(n 2 k)

def seq_len_max(seq):
    n = len(seq)
    T = [0 for _ in range(n)]

    for i in range(0, n):
        max_len = max([T[k] for k in range(0, i) if seq[k] <= seq[i]], \
                  default = 0)
        T[i] = max_len + 1

    # Ricostruisco la soluzione.
    sol = []
    index = max([(T[i], i) for i in range(n)])[1]
    sol.append(seq[index])

    len_sol = T[index]
    while len(sol) != len_sol:
        index = max([(T[i], i) for i in range(index) if seq[i] <= seq[index]])[1]
        sol.append(seq[index])

    sol.reverse()
    return sol

def seq_val_max(seq):
    n = len(seq)
    T = [0 for _ in range(n + 1)]

    for i in range(1, n + 1):
        max_len = max([T[k] for k in range(1, i) if seq[k - 1] <= seq[i - 1]], \
                  default = 0)
        T[i] = max_len + seq[i - 1]

    # Ricostruisco la soluzione.
    sol = []
    index = max([(T[i], i) for i in range(n + 1)])[1]

    value = T[index]
    while value != 0:
        value -= seq[index - 1]
        sol.append(seq[index - 1])
        index = max([(T[i], i) for i in range(index) if seq[i - 1] <= seq[index - 1]])[1]

    sol.reverse()
    return sol

def seq_num(seq):
    n = len(seq)
    T = [0 for _ in range(n)]

    for i in range(0, n):
        T[i] = sum([T[k] for k in range(0, i) if seq[k] <= seq[i]]) + 1

    return sum(T)

def seq_num_len(seq, k):
    n = len(seq)
    T = [[1 for _ in range(n)] for _ in range(k)]

    for i in range(1, k):
        for j in range(n):
            T[i][j] = sum([T[i - 1][y] for y in range(0, j) if seq[y] <= seq[j]])

    return sum(T[k - 1])

if __name__ == "__main__":
    seq = [50, 2, 1002, 48, 3, 34, 30]
    print("seq =", seq)
    seq2 = [50, 2, 100, 1, 20, 30]
    print("seq2 =", seq2)
    seq3 = [5, 3, 7, 8, 6]
    print("seq3 =", seq2)

    res = seq_len_max(seq)
    print("seq_len_max(seq) =", res)
    print("expected = [2, 3, 30]")
    print()

    res = seq_val_max(seq2)
    print("seq_val_max(seq2) =", res)
    print("expected = [50, 100]")
    print()

    res = seq_num(seq3)
    print("seq_num(seq3) =", res)
    print("expected = 14")
    print()

    res = seq_num_len(seq3)
    print("seq_num_len(seq3) =", res)
    print("expected = 7")
    print()
