from heapq import heappush, heappop

def partizionamento_attivita(lista):
    '''Ritorna un dizionario con il partizionamento della attività per ogni
       operaio.'''

    partizionamento = {0:set()}
    lista = sorted(lista)

    liberi = []
    heappush(liberi, (0, 0))

    ultimo_operaio = 0
    for inizio, fine in lista:
        # Controllo inzio con il primo elemento dell'heap (il minimo), senza
        # estrarlo.
        if inizio >= liberi[0][0]: # (libero, op.°) <- scelgo 'libero'
            _, operaio = heappop(liberi)
            partizionamento[operaio].add((inizio, fine))
            heappush(liberi, (fine + 1, operaio))

        # Nuovo operaio perchè quelli di prima sono tutti occupati.
        else:
            ultimo_operaio += 1
            partizionamento[ultimo_operaio] = {(inizio, fine)}
            heappush(liberi, (fine + 1, ultimo_operaio))

    return partizionamento
