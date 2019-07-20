def sudoku9(mat_src):
    '''Risolve un sudoku da nxn.'''
    from math import sqrt

    def getSect(row, column):
        '''
        Restitisce il settore di appartenenza della cella di riga 'row' e
        colonna 'column'.
        '''
        return (row // sect_dim) * sect_dim + column // sect_dim

    def genera(riga, colonna):
        ''' Genera la soluzione utilizzando la tecnica del backgracking.'''
        if riga == len(mat):
            return True
        else:
            if mat_src[riga][colonna] == 0:

                # Numeri possibili per la cella.
                num_pos = {i for i in range(1, len(mat) + 1)}
                num_pos -= num["r"][riga]
                num_pos -= num["c"][colonna]
                num_pos -= num["s"][getSect(riga, colonna)]

                for i in num_pos:
                    num["r"][riga].add(i)
                    num["c"][colonna].add(i)
                    num["s"][getSect(riga, colonna)].add(i)

                    mat[riga][colonna] = i

                    if colonna + 1 < len(mat):
                        if genera(riga, colonna + 1):
                            return True
                    else:
                        if genera(riga + 1, 0):
                            return True

                    mat[riga][colonna] = 0

                    num["r"][riga].remove(i)
                    num["c"][colonna].remove(i)
                    num["s"][getSect(riga, colonna)].remove(i)
            else: # Numero preimpostato, vado avanti.
                if colonna + 1 < len(mat):
                    if genera(riga, colonna + 1):
                        return True
                else:
                    if genera(riga + 1, 0):
                        return True

    def prepSettori(mat):
        sett = {i : set() for i in range(0, len(mat))}
        sett_n = 0

        for row in range(len(mat)):
            for column in range(len(mat)):
                sett[getSect(row, column)].add(mat[row][column])

        return sett

    # Effettuo una copia della matrice, quella originale me la tengo come
    # riferimento, l'altra la uso nell'algoritmo.
    mat = [mat_src[i].copy() for i in range(len(mat_src))]

    # Dimensione di ogni settore.
    sect_dim = int(sqrt(len(mat)))

    # Prepara degli insiemi relativi alle righe "r", colonna "c" e settore "s",
    # dove per ognuno ci sono i numeri attualmente utilizzati.
    num = {
        "r": {i : set(mat[i]) - {0} for i in range(len(mat))},
        "c": {i : {mat[j][i] for j in range(len(mat))} - {0}
                  for i in range(len(mat))},
        "s": prepSettori(mat)
    }

    genera(0, 0)
    return mat

mat9 = [
    [0,0,5,3,0,0,0,0,0],
    [8,0,0,0,0,0,0,2,0],
    [0,7,0,0,1,0,5,0,0],
    [4,0,0,0,0,5,3,0,0],
    [0,1,0,0,7,0,0,0,6],
    [0,0,3,2,0,0,0,8,0],
    [0,6,0,5,0,0,0,0,9],
    [0,0,4,0,0,0,0,3,0],
    [0,0,0,0,0,9,7,0,0]
]

mat16 = [
    [0,0,5,0,4,8,0,0,0,0,13,12,0,2,0,0],
    [0,0,0,0,3,5,15,14,11,2,10,1,0,0,0,0],
    [1,0,4,6,0,0,0,0,0,0,0,0,8,7,0,10],
    [0,0,2,3,0,10,0,0,0,0,5,0,11,15,0,0],
    [2,12,0,0,0,0,6,11,10,15,0,0,0,0,4,16],
    [6,3,0,14,0,0,0,0,0,0,0,0,9,0,10,7],
    [0,10,0,0,9,0,2,8,3,1,0,7,0,0,12,0],
    [0,4,0,0,10,0,3,0,0,16,0,6,0,0,8,0],
    [0,5,0,0,6,0,1,0,0,11,0,15,0,0,16,0],
    [0,6,0,0,12,0,8,16,5,4,0,9,0,0,2,0],
    [16,9,0,2,0,0,0,0,0,0,0,0,13,0,11,14],
    [10,15,0,0,0,0,14,3,16,13,0,0,0,0,1,6],
    [0,0,6,7,0,3,0,0,0,0,11,0,14,8,0,0],
    [12,0,3,16,0,0,0,0,0,0,0,0,2,4,0,5],
    [0,0,0,0,14,15,13,12,8,7,9,3,0,0,0,0],
    [0,0,10,0,8,6,0,0,0,0,1,4,0,13,0,0],
]

mat16_2 = [
    [15,16,5,0,4,8,11,6,0,0,13,12,0,2,0,0],
    [0,0,0,0,3,5,15,14,11,2,10,1,16,6,13,4],
    [1,0,4,6,2,12,0,0,0,0,0,0,8,7,0,10],
    [0,0,2,3,0,10,0,0,0,0,5,0,11,15,0,0],
    [2,12,0,0,0,0,6,11,10,15,0,0,0,0,4,16],
    [6,3,0,14,15,1,12,4,0,0,0,0,9,0,10,7],
    [0,10,0,0,9,0,2,8,3,1,0,7,0,0,12,0],
    [0,4,0,0,10,0,3,0,0,16,0,6,0,0,8,0],
    [0,5,0,0,6,0,1,0,0,11,0,15,0,0,16,0],
    [0,6,0,0,12,0,8,16,5,4,0,9,0,0,2,0],
    [16,9,0,2,0,0,0,0,0,0,0,0,13,0,11,14],
    [10,15,7,4,0,0,14,3,16,13,0,0,0,0,1,6],
    [0,0,6,7,0,3,0,0,0,0,11,0,14,8,0,0],
    [12,8,3,16,1,11,10,9,0,0,0,0,2,4,0,5],
    [0,0,0,0,14,15,13,12,8,7,9,3,0,0,0,0],
    [0,0,10,0,8,6,0,0,0,0,1,4,12,13,0,0],
]

if __name__ == "__main__":
    pass
