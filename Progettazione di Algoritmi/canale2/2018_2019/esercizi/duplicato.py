def duplicato(lista):
    '''Restituisce l'intero duplicato nella lista ordinata di n interi con
    interi da 0 a n - 2, in tempo O(log n). Se la lista è più corta di 2
    elementi restituisce -1.

    La lista deve avere sempre un duplicato.'''

    if len(lista) < 2:
        return -1

    start = 0
    stop = len(lista)
    while True: # trova sempre un duplicato.
        mid = start + (stop - start) // 2

        if lista[mid - 1] == lista[mid] \
           or lista[mid + 1] == lista[mid]:
               return lista[mid] # duplicato trovato!

        # Mi aspetto che corrisponda, poichè so i valori nella lista. Se non è
        # così significa che nella prima parte c'è un duplicato, altrimenti sta
        # nella seconda.
        if lista[mid] == mid:
            start = mid + 1
        else:
            stop = mid - 1
