def init(n):
    return [x for x in range(n)]

def find(comp, x):
    return comp[x]

def union(comp, x, y):
    def replace(occur, value):
        for indice in range(len(comp)):
            if comp[indice] == occur:
                comp[indice] = value

    comp_x, comp_y = comp[x], comp[y]

    if comp_x != comp_y:
        if comp_x < comp_y:
            replace(comp_y, comp_x)
        else:
            replace(comp_x, comp_y)
