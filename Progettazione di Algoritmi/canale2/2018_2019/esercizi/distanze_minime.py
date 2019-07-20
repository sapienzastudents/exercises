from collections import deque

def distanze_minime(lista):
    # Componenti di un punto.
    X = 0
    Y = 1

    # Componenti di min_distance.
    distance = 0
    first = 1
    second = 2

    def merge(left, right):
        '''Restituisce una lista che unisce le due deque ordinate per la Y con
        tempo O(n).'''
        result = deque()

        while left and right:
            if left[0][Y] <= right[0][Y]:
                result.append(left.popleft())
            else:
                result.append(right.popleft())

        # 'left' o 'right' sarà vuoto, quindi lo svuoto in 'result'.
        return result + left + right

    def discard_useless_points(points, sx_bound_x, dx_bound_x):
        '''Restituisce una nuova lista con solamente i punti che si trovano
        all'interno del range [sx_bound_x, dx_bound_x] per la X. Non altera
        l'ordine dei punti. Costo O(n).'''
        result = deque()

        while points:
            point = points.popleft()

            if point[X] >= sx_bound_x and point[X] <= dx_bound_x:
                result.append(point)

        return result

    def distanza(primo_punto, secondo_punto):
        '''Resituisce la distanza fra i due punti con complessità O(1).'''
        (x1, y1), (x2, y2) = primo_punto, secondo_punto
        return (x1 - x2) ** 2 + (y1 - y2) ** 2

    def distanza_min(punti):
        if len(punti) == 2 or len(punti) == 3: # Caso base, tutto in O(1).
            # So per certo che punti è di lunghezza 2 o 3, quindi tale passaggio
            # è costante.
            min_distance = min([(distanza(p1, p2), p1, p2) for p1 in punti
                                                           for p2 in punti
                                                           if p1 != p2])
            # Ordina per la Y.
            punti.sort(key=lambda punto: punto[Y])
            punti = deque(punti)

            return min_distance, punti

        # Suddivido il problema.
        mid_index = len(punti) // 2
        mid = punti[mid_index]

        distanza_min_sx, punti_sx = distanza_min(punti[:mid_index])
        distanza_min_dx, punti_dx = distanza_min(punti[mid_index:])

        min_distance = min(distanza_min_sx, distanza_min_dx)
        delta = min_distance[distance]

        # Mi ricavo la lista dei soli punti che conviene confrontare, creando un
        # corridoio.
        punti = merge(punti_sx, punti_dx)
        punti = discard_useless_points(merge(punti_sx, punti_dx),
                                       mid[X] - delta,
                                       mid[X] + delta)

        # Controllo ogni punto con massimo i successivi 7.
        punto_index = 0
        while punto_index < len(punti) - 1:
            punto = punti[punto_index]

            check_index = punto_index + 1
            while check_index < len(punti) and check_index - punto_index <= 7:
                check = punti[check_index]

                # È inutile continuare se i punti successivi superano delta.
                if check[Y] - punto[Y] > delta:
                    break

                tmp_distance = distanza(punto, check), punto, check
                if tmp_distance < min_distance:
                    min_distance = tmp_distance

                check_index += 1

            punto_index += 1

        return min_distance, punti

    lista.sort() # Ordino i punti per la coordinata X.

    return distanza_min(lista)[0] # Solo la distanza minima con i punti.
