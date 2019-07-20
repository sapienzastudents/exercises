def distanza(padri, src, dst):
    def cammino(nodo):
        cammino = []

        while padri[nodo] != nodo:
            cammino.append(nodo)
            nodo = padri[nodo]

        cammino.append(nodo)

        return cammino

    def trovaRadice():
        nodo = 0
        while nodo != padri[nodo]:
            nodo += 1

        return nodo

    # Caso 1.
    if src == dst:
        return 0

    # Caso 2.
    radice = trovaRadice()

    if src == radice:
        return len(cammino(dst)) - 1
    elif dst == radice:
        return len(cammino(src)) - 1

    # Caso 3.
    cammino_src, cammino_dst = cammino(src), cammino(dst)
    indice_src, indice_dst = len(cammino_src) - 1, len(cammino_dst) - 1

    while indice_src >= 0 and indice_dst >= 0 \
          and cammino_src[indice_src] == cammino_dst[indice_dst]:
        indice_src -= 1
        indice_dst -= 1

    indice_src += 1
    indice_dst += 1

    return len(cammino_src[:indice_src]) + len(cammino_dst[:indice_dst])
