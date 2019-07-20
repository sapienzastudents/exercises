def es9(n):
    from math import inf

    t = [inf for _ in range(0, n + 1)]
    t[0] = 0

    for i in range(1, n + 1):
        j = 1
        while j * j <= i:
            t[i] = min(t[i], t[i - j * j] + 1)
            j  += 1

    return t[n]
