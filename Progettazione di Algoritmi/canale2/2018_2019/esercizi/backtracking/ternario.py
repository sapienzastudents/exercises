# Dato un numero n, contare le stringhe lunghe n su un alfabeto ternario {'a',
# 'b', 'c'} in cui #a <= #b <= #c, in tempo O(n * S(n)).
#
# Esempio:
#   n | conteggio
#   --|----------
#   1 | 1 ('c')
#   2 | 3 ('cc', 'cb', 'bc')
#   3 | 10 ('cba' e permutazioni, 'ccc', 'ccb' e combinazioni)
#   4 | 24

def ternario(n):
    '''
    Restituisce il numero di stringhe con alfabeto ternario {'a', 'b', 'c'}
    tale che #a <= #b <= #c.
    '''

    def genera(i = 0, a = 0, b = 0, c = 0):
        if i == n: # foglia
            return 1
        else: # nodo interno
            total = 0

            # Aggiunta di una 'a'.
            b1 = max(0, a + 1 - b) # b necessarie a coprire la 'a' aggiunta
            c1 = max(0, b + b1 - c) # c necessarie per coprire a sua volta 'b'.
            if b1 + c1 <= n - i - 1:
                total += genera(i + 1, a + 1, b, c)

            # Aggiunta di una 'b'.
            b1 = max(0, a - (b + 1))
            c1 = max(0, b + 1 + b1 - c)
            if b1 + c1 <= n - i - 1:
                total += genera(i + 1, a, b + 1, c)

            # Aggiunta di una 'c'.
            b1 = max(0, a - b)
            c1 = max(0, b + b1 - (c + 1))
            if b1 + c1 <= n - i - 1:
                total += genera(i + 1, a, b, c + 1)

            return total

    return genera()
