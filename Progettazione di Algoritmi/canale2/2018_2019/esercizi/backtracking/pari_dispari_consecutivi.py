def pari_dispari_consecutivi(n):
    '''
    Stampa tutte le permutazioni dei primi n interi in cui nell'ordinamento non
    appaiono mai due pari consecutivi nè due dispari consecutivi. Ad esempio
    per n = 4 sono stampate le seguenti 8 permutazioni:

    1234 1432 3214 3412 2143 2341 4123 4321

    Ha complessità O(S(n) * n^2) con S(n) il numero di permutazioni da stampare.
    '''

    def check(sol):
        if len(sol) < 2:
            return True

        for i in range(1, len(sol)):
            num = int(sol[i])
            adj = int(sol[i - 1])

            if num % 2 == adj % 2:
                return False

        return True

    def genera(sol = [], num = {i for i in range(1, n + 1)}):
        nonlocal interni, foglie
        if len(sol) == n:
            foglie += 1
            print(''.join(sol))
        else:
            interni += 1
            for i in range(1, n + 1):
                sol.append(str(i))

                if i in num and check(sol):
                    num.remove(i)
                    genera(sol)
                    num.add(i)

                sol.pop()

    interni = 0
    foglie = 0
    genera()
    return interni, foglie
