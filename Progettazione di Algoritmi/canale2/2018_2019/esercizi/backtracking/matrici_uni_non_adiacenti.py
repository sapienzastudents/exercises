def matrici_uni_non_adiacenti(n):
    '''
    Stampa le matrici binarie nxn che non hanno uni adiacenti nelle otto
    direzioni. Tempo O(S(n) * n^2), con S(n) il numero di matrici da stampare.
    '''

    def check(row, col):
        result = True

        if col != 0 and row != 0:
            result = not sol[row - 1][col - 1]
        if col != 0:
            result &= not sol[row][col - 1]
        if row != 0:
            result &= not sol[row - 1][col]
        if row != 0 and col + 1 != n:
            result &= not sol[row - 1][col + 1]

        return result

    def genera(row = 0, col = 0):
        nonlocal interni, foglie
        if row == n:
            foglie += 1
            for row in sol:
                print(row)
            print()
        else:
            interni += 1

            for i in {0, 1}:
                if i == 0 or check(row, col):
                    sol[row][col] = i

                    if col + 1 == n:
                        rown = row + 1
                        coln = 0
                    else:
                        rown = row
                        coln = col + 1

                    genera(rown, coln)

    interni = 0
    foglie = 0
    sol = [[0 for _ in range(n)] for _ in range(n)]
    genera()
    return interni, foglie
