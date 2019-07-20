def blocchi_pari_dispari(n):
    '''
    Stampa le stringhe lunghe n composte da simboli {'a', 'b'} per cui il numero
    di 'a' e il numero di 'b' risulta dispari. In tempo O(S(n) * n), con S(n) il
    numero di stringhe da stampare.
    '''
    def genera(an = 0, bn = 0, sol = []):
        nonlocal interni, foglie
        if len(sol) == n:
            foglie += 1
            print(''.join(sol))
        else:
            interni += 1
            spazio_rimasto = n - len(sol)

            # 'a' necessarie per farle risultare dispari se ne aggiungo una
            a_necessarie = ((1 if not an % 2 else 0) + 1) % 2
            # 'b' necessarie per farle risultare dispari
            b_necessarie = 1 if not bn % 2 else 0

            if a_necessarie + b_necessarie <= spazio_rimasto:
                sol.append("a")
                genera(an + 1, bn)
                sol.pop()

            a_necessarie = 1 if not an % 2 else 0
            b_necessarie = ((1 if not bn % 2 else 0) + 1) % 2

            if a_necessarie + b_necessarie <= spazio_rimasto:
                sol.append("b")
                genera(an, bn + 1)
                sol.pop()

    interni = 0
    foglie = 0
    genera()
    return interni, foglie
