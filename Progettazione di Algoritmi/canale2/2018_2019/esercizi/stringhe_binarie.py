def tzc_old(n):
    def tzc(n, stringa, ultimi_zeri, zeri_consecutivi):
        if ultimi_zeri == 3:
            zeri_consecutivi = True

        if n == 0:
            #print(stringa, zeri_consecutivi)
            return 1 if zeri_consecutivi else 0

        n -= 1
        return tzc(n, stringa + "1", 0, zeri_consecutivi) \
               + tzc(n, stringa + "0", ultimi_zeri + 1, zeri_consecutivi)

    return 2 ** n - tzc(n, "", 0, False)
    #return tzc(n, "", 0, False)

def tzc_top_down(n):
    def tzc(n):
        if zeri_consecutivi[n] != -1:
            return zeri_consecutivi[n]

        if zeri_consecutivi[n - 1] == -1:
            tzc(n - 1)

        uno_zeri[n] = zero_zeri[n - 1]
        due_zeri[n] = uno_zeri[n - 1]
        tre_zeri[n] = due_zeri[n - 1] + tre_zeri[n - 1]

        zero_zeri[length] = 2 ** n // 2

        zeri_consecutivi[n] = zeri_consecutivi[n - 1] + \
                              zeri_consecutivi[n - 2] + \
                              zeri_consecutivi[n - 3] + \
                              tre_zeri[n]

        return zeri_consecutivi[n]

    if n < 3:
        return 0

    zero_zeri = [-1 for _ in range(n + 1)]
    uno_zeri = [-1 for _ in range(n + 1)]
    due_zeri = [-1 for _ in range(n + 1)]
    tre_zeri = [-1 for _ in range(n + 1)]
    zeri_consecutivi = [-1 for _ in range(n + 1)]

    zero_zeri[0] = 0
    uno_zeri[0] = 0
    due_zeri[0] = 0
    tre_zeri[0] = 0
    zeri_consecutivi[0] = 0

    zero_zeri[1] = 1
    uno_zeri[1] = 1
    due_zeri[1] = 0
    tre_zeri[1] = 0
    zeri_consecutivi[1] = 0

    zero_zeri[2] = 2
    uno_zeri[2] = 1
    due_zeri[2] = 1
    tre_zeri[2] = 0
    zeri_consecutivi[2] = 0

    return 2 ** n - tzc(n)

def tzc_new_top_down(n):
    def tzc(n):
        if zeri_consecutivi[n] != -1:
            return zeri_consecutivi[n]

        num = 2 ** n
        zeri_consecutivi[n] = tzc(n - 1) + tzc(n - 2) + tzc(n - 3) \
                              + num - (num // 2 + num // 4 + num // 8)

        return zeri_consecutivi[n]

    if n < 3:
        return 2 ** n

    zeri_consecutivi = [-1 for _ in range(n + 1)]
    zeri_consecutivi[0] = zeri_consecutivi[1] = zeri_consecutivi[2] = 0

    return 2 ** n - tzc(n)


def tzc_new_bottom_up(n):
    if n < 3:
        return 2 ** n

    zeri_consecutivi = [0 for _ in range(n + 1)]

    for length in range(3, n + 1):
        num = 2 ** length

        zeri_consecutivi[length] = \
                zeri_consecutivi[length - 1] \
                + zeri_consecutivi[length - 2] \
                + zeri_consecutivi[length - 3] \
                + num - (num // 2 + num // 4 + num // 8)

    print(zeri_consecutivi)

    return 2 ** n - zeri_consecutivi[n]

def tzc_bottom_up(n):
    if n < 3:
        return 2 ** n

    zero_zeri = [0 for _ in range(n + 1)]
    uno_zeri = [0 for _ in range(n + 1)]
    due_zeri = [0 for _ in range(n + 1)]
    tre_zeri = [0 for _ in range(n + 1)]
    zeri_consecutivi = [0 for _ in range(n + 1)]

    zero_zeri[1] = 1
    uno_zeri[1] = 1

    zero_zeri[2] = 2
    uno_zeri[2] = 1
    due_zeri[2] = 1

    # DEBUG
    #print()
    #print("Tot.\t", zeri_consecutivi)
    #print("3 c\t", tre_zeri)
    #print("2 c\t", due_zeri)
    #print("1 c\t", uno_zeri)
    #print("0 c\t", zero_zeri)

    for length in range(3, n + 1):
        uno_zeri[length] = zero_zeri[length - 1]
        due_zeri[length] = uno_zeri[length - 1]
        tre_zeri[length] = due_zeri[length - 1] + tre_zeri[length - 1]

        zero_zeri[length] = 2 ** length // 2

        zeri_consecutivi[length] = zeri_consecutivi[length - 1] + \
                                   zeri_consecutivi[length - 2] + \
                                   zeri_consecutivi[length - 3] + \
                                   tre_zeri[length]

        # DEBUG
        #print()
        #print("Tot.\t", zeri_consecutivi)
        #print("3 c\t", tre_zeri)
        #print("2 c\t", due_zeri)
        #print("1 c\t", uno_zeri)
        #print("0 c\t", zero_zeri)

    return 2 ** n - zeri_consecutivi[n]
