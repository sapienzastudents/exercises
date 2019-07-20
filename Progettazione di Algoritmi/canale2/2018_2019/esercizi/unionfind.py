class Unionfind:
    '''Struttura dati generica che gestisce l'unionfind.'''

    # Indici della tupla.
    comp = 0
    weight = 1

    def __init__(self, length):
        '''Costruisce la struttura con un array di dimensione 'length'. Ogni
           componente è indicizzata da 0 a length - 1.'''

        # Array che contiene le componenti e il peso di ognuna.
        self.vector = [(x, 1) for x in range(length)]

    def find(self, x):
        '''Restituisce la componente dell'indice 'x' con il suo peso.'''
        while x != self.vector[x][self.comp]:
            x = self.vector[x][self.comp]

        return self.vector[x]

    def union(self, x, y):
        '''Unisce le componenti 'x' e 'y'.'''

        weight_x, weight_y = x[self.weight], y[self.weight]
        x, y = x[self.comp], y[self.comp]

        if weight_x < weight_y:
            self.vector[x] = y, weight_x
            self.vector[y] = y, weight_y + weight_x
        else:
            self.vector[y] = x, weight_y
            self.vector[x] = x, weight_x + weight_y

    def __repr__(self):
        return self.__str__()

    def __str__(self):
        return str(self.vector)
