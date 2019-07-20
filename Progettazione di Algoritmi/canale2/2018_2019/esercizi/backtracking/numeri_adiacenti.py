def numeri_adiacenti(n):
    '''
    Stampa tutte le sequenze lunghe n formati da {'1', '2', '3', '4'} per cui
    numeri adiacenti nella sequenza distano almeno di 2.

    Ad esempio per n = 3 delle 4 3 = 64 possibili sequenze ne vanno stampate
    solo 10, vale a dire: 131 141 142 241 242 313 314 413 414 424.

    In tempo O(n * S(n)), con S(n) il numero delle sequenze da stampare.
    '''

    def check(sol):
        if len(sol) < 2:
            return True

        adj = int(sol[len(sol) - 1])
        num = int(sol[len(sol) - 2])

        if num < adj and num + 1 >= adj:
            return False

        if num > adj and num - 1 <= adj:
            return False

        if num == adj:
            return False

        return True

    def genera(sol = []):
        nonlocal interni, foglie
        if len(sol) == n:
            foglie += 1
            print(''.join(sol))
        else:
            interni += 1
            sol.append('1')
            if check(sol):
                genera()
            sol.pop()

            sol.append('2')
            if check(sol):
                genera()
            sol.pop()

            sol.append('3')
            if check(sol):
                genera()
            sol.pop()

            sol.append('4')
            if check(sol):
                genera()
            sol.pop()

    interni = 0
    foglie = 0
    genera()
    return interni, foglie
