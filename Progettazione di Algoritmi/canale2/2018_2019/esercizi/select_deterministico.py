from math import ceil

def select(lista, k):
    def selectPerno():
        '''Restituisce il perno.'''

        gruppi = ceil(len(lista) / 5)

        # Divido in gruppi di 5 e ordino questi gruppetti (tranne l'ultimo).
        liste = []
        indice_gruppo = 0
        indice_lista = 0
        while indice_gruppo < gruppi - 1:
            gruppo = []
            gruppo.append(lista[indice_lista])
            gruppo.append(lista[indice_lista + 1])
            gruppo.append(lista[indice_lista + 2])
            gruppo.append(lista[indice_lista + 3])
            gruppo.append(lista[indice_lista + 4])

            gruppo.sort()
            liste.append(gruppo)

            indice_gruppo += 1
            indice_lista += 5

        # Gestisco l'ultimo gruppo, non è detto che sia lungo 5.
        ultimo_gruppo = lista[(gruppi - 1) * 5 :]
        ultimo_gruppo.sort()

        # Prendo i mediani di ogni gruppo. L'ultimo gruppo lo gestisco a parte.
        mediani = []

        for gruppo in liste:
            mediani.append(gruppo[3])

        mediani.append(ultimo_gruppo[len(ultimo_gruppo) // 2])

        return select(mediani, ceil(gruppi / 2))

    # Caso base, k è proprio l'unico elemento della lista.
    if len(lista) == 1:
        return lista[0]

    # Caso in cui conviene fare un classico sort (in questo caso Python utilizza
    # il Timsort).
    if len(lista) <= 60:
        return sorted(lista)[k]

    perno = selectPerno()

    minori = [x for x in lista if x < perno]
    maggiori = [x for x in lista if x >= perno]

    if len(minori) == k: # k è proprio il perno.
        return perno

    if len(minori) >= k: # k si trova dentro minori, altrimenti in maggiori.
        return select(minori, k)

    return select(maggiori, k - len(minori))

if __name__ == '__main__':
    from random import randint

    for lun in range(3, 1000):
        a = [randint(0, 10000) for _ in range(lun)]
        indice = randint(0, len(a) - 1)

        ris_a = select(a, indice)
        ris_b = sorted(a)[indice]

        if ris_a != ris_b:
            print("L'algoritmo non funziona!")
