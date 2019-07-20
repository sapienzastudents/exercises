def matrici_simboli_crescenti(n):
    '''
    Stampa tutte le matrici n x n per cui i simboli in ogni riga e colonna sono
    in ordine crescente. I simboli sono {1, 2, 3}.
    Complessità O(n^2 S(n)) dove S(n) è il numero di matrici da stampare.
    '''

    def check(sol):
        for row in sol:
            for i in range(1, n):
                if row[i - 1] > row[i]:
                    return False

        for column in range(n):
            for i in range(1, n):
                if sol[i - 1][column] > sol[i][column]:
                    return False

        return True

    def genera(row = 0, col = 0):
        nonlocal foglie, interni
        if row == n:
            foglie += 1
            for row in sol:
                print(row)
            print()
        else:
            interni += 1
            for i in {1, 2, 3}:
                # 1. Angolo in alto a sx, 2. Prima colonna, 3. Prima riga, 4.
                # Caso generale.
                if (row == 0 and col == 0) \
                   or (col == 0 and sol[row - 1][col] <= i) \
                   or (row == 0 and sol[row][col - 1] <= i) \
                   or (sol[row - 1][col] <= i and sol[row][col - 1] <= i):
                    sol[row][col] = i

                    if col + 1 == n:
                        rown = row + 1
                        coln = 0
                    else:
                        rown = row
                        coln = col + 1

                    genera(rown, coln)

    foglie = 0
    interni = 0
    sol = [[0 for _ in range(n)] for _ in range(n)]
    genera()
    return interni, foglie
