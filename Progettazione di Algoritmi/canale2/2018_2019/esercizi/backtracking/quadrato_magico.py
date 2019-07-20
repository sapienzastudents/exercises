def quadrato_magico(n):
    '''
    Stampa i possibili quadrati magici di dimensione n x n. Un quadrato magico è
    una matrice con elementi {1, ..., n^2} tale che la somma delle righe e delle
    colonne è sempre la stessa.
    '''

    def genera(row = 0, col = 0, usati = set()):
        nonlocal first_diag_sum, second_diag_sum
        nonlocal foglie, interni
        if row == n:
            foglie += 1
            for row in sol:
                print(row)
            print()
        else:
            interni += 1

            for i in range(1, (n * n) + 1):
                if i not in usati \
                   and row_sum[row] + i <= somma \
                   and col_sum[row] + i <= somma \
                   and (row != col or first_diag_sum + i <= somma) \
                   and (row + col != n or second_diag_sum + i <= somma):
                    sol[row][col] = i

                    if col + 1 == n:
                        rown = row + 1
                        coln = 0
                    else:
                        rown = row
                        coln = col + 1

                    usati.add(i)
                    genera(rown, coln)
                    usati.remove(i)

    interni = 0
    foglie = 0
    somma = (n * (n * n + 1)) / 2
    sol = [[0 for _ in range(n)] for _ in range(n)]
    row_sum = [0 for _ in range(n)]
    col_sum = [0 for _ in range(n)]
    first_diag_sum = 0
    second_diag_sum = 0
    genera()
    print(somma)
    return interni, foglie
