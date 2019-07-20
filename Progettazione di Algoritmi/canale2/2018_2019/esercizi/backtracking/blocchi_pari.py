def blocchi_pari(n):
    '''
    Stampa le stringhe lunghe n composte da {'a', 'b'} per cui il numero di 'a'
    risulta sempre pari in un blocco consecutivo. In tempo O(S(n) * n), con S(n)
    il numero di stringhe da stampare.
    '''

    def genera(an = 0, sol = []):
        if len(sol) == n:
            print(''.join(sol))
        else:
            a_necessarie = an % 2
            spazio_rimasto = n - len(sol)

            if (a_necessarie == 0 and spazio_rimasto > 1) or a_necessarie == 1:
                sol.append("a")
                genera(an + 1)
                sol.pop()

            if a_necessarie == 0:
                sol.append("b")
                genera(0)
                sol.pop()


    genera()
