# Dato un intero positivo n, restituisce il numero di stringhe binarie lunghe n
# in cui non compaiono mai tre uni consecutivi, in tempo O(n).
#
# Esempio: n = 4, le stringhe sono 13
# 0000 1000 0100 0010 0001 1010 1001 0101 0011 1011 0110 1100 1101

def prog_din(n):
    T = [0 for _ in range(n + 1)]

    T[1] = 2
    T[2] = 4
    T[3] = 7

    for i in range(4, n + 1):
        T[i] = T[i - 1] + T[i - 2] + T[i - 3]

    return T[n]

# Implementazione esaustiva e backtracking per esercizio, non è richiesto.

def esaustivo(n):
    def check(sol):
        pre1 = sol[1]
        pre2 = sol[0]

        for i in range(2, len(sol)):
            if pre1 == '1' and pre2 == '1' and sol[i] == '1':
                return False

            pre2 = pre1
            pre1 = sol[i]

        return True

    def genera(sol = []):
        if len(sol) == n:
            return 1 if check(sol) else 0
        else:
            total = 0

            sol.append('0')
            total += genera()
            sol.pop()

            sol.append('1')
            total += genera()
            sol.pop()

            return total

    return genera()

def backtracking(n):
    def genera(i = 0, pre1 = '0', pre2 = '0'):
        if i == n:
            return 1
        else:
            total = 0
            total += genera(i + 1, '0', pre1)

            if pre1 != '1' or pre2 != '1':
                total += genera(i + 1, '1', pre1)

            return total

    return genera()
