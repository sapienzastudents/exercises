def match_esaustivo(X, primitive):
    def genera(start = 0):
        if start == len(X):
            return True
        else:
            for i in range(start, len(X)):
                substr = X[start:i + 1]

                if substr in primitive:
                    if genera(i + 1):
                        return True

            return False

    return genera()

def match_dp(X, primitive):
    def match(string):
        n = len(string)
        if n == 0:
            return True
        else:
            if T[n] == -1:
                print("non dp, string =", string)
                T[n] = 0

                for i in range(1, n + 1):

                    prefix = string[: i]

                    if prefix in primitive and match(string[i :]):
                        T[n] = 1
                        return True

                return T[n]
            else:
                print("dp, string =", string)
                return T[n]


    T = [-1 for _ in range(len(X) + 1)]
    return match(X)
