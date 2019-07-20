def square(integer):
    def square(leftBound, rightBound):
        # Se il range è composto solo da due numeri, il sinistro è la radice di
        # integer.
        if rightBound - leftBound == 1:
            return leftBound

        mid = (leftBound + rightBound) // 2

        # Caso fortunato in cui becco precisamente la radice di integer.
        if mid ** 2 == integer:
            return mid

        if mid ** 2 > integer: # Controllo la parte a sinistra.
            return square(leftBound, mid)

        # Controllo la parte a destra.
        return square(mid, rightBound)

    return square(0, integer)
