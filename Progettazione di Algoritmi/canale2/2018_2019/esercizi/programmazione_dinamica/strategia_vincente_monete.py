def es8(n):
    if n < 5: # Casi base
        return True if n != 1 and n != 3 else False

    strategia_vincente = [False for _ in range(n + 1)]

    strategia_vincente[0] = True
    strategia_vincente[2] = True
    strategia_vincente[4] = True

    for i in range(5, n + 1):
        strategia_vincente[i] = not strategia_vincente[i - 1] \
                                or not strategia_vincente[i - 3] \
                                or not strategia_vincente[i - 4]

    return strategia_vincente[n]
