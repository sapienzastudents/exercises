def blocchi_palindromi(n):
    '''
    Stampa tutte le stringhe lunghe 2 * n composte da {'a', 'b'} per cui
    risultano palindrome. In tempo O(n * 2^n).
    '''

    def genera(i = 0, sol = [0 for _ in range(2 * n)]):
        if i == n:
            print(''.join(sol))
        else:
            sol[i] = 'a'
            sol[2 * n - i - 1] = 'a'
            genera(i + 1)

            sol[i] = 'b'
            sol[2 * n - i - 1] = 'b'
            genera(i + 1)

    genera()
