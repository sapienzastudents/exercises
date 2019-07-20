def matrici_simboli_uguali(n):
    '''
    Stampa tutte le matrici quadrate di dimensione n x n con ogni riga con
    simboli uguali. I simboli possono essere {'a', 'b', 'c'}. In tempo O(S(n) *
    n^ 2), con S(n) il numero di matrici da stampare.
    '''

    def genera(row = 0, col = 0, last_col_char = ''):
        nonlocal interni, foglie

        if row == n:
            foglie += 1
            for row in sol:
                print(row)
            print()
        else:
            interni += 1
            for char in {'a', 'b', 'c'}:
                if col == 0 or last_col_char == char:
                    sol[row][col] = char

                    if col + 1 == n:
                        rown = row + 1
                        coln = 0
                        last_col_char = ''
                    else:
                        rown = row
                        coln = col + 1
                        last_col_char = char

                    genera(rown, coln, last_col_char)

    interni = 0
    foglie = 0
    sol = [[0 for _ in range(n)] for _ in range(n)]
    genera()
    return interni, foglie
