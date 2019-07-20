# Problema: date tre stringhe x, y, z, le prime due di lunghezza n e la terza di
# lunghezza 2 * n, dire che z è un mescolamento di x e y. Per mescolamento si
# intende che x è una sottosequenza in z, e che rimossa x rimane solamente y.
#
# Esempio: x = "aabddq" y ="abdpab"
#          z = "abaadbdpdqab"
#               yyxxyxxyxxyy
#
# Soluzione: con il metodo esaustivo provo tutte le assegnazioni possibili alle
# due stringhe, che aumentano di molto se ci sono simboli in comune (come
# nell'esempio). Funzione di taglio: se un assegnamento non è possibile, non lo
# fa. Infatti un simbolo potrebbe essere assegnato a entrambe le stringhe, a una
# sola o a nessuna. Se si riesce a completare l'assegnamento si è trovata la
# soluzione.
#
# Complessità esponenziale di O(4^n).

def interleaving_bk(x, y, z):
    '''
    Restituisce 'True' se in 'z' c'è la sottosequenza 'x' e rimossa 'x' da
    'z' c'è la sottosequenza 'y' e rimossa anche 'y', 'z' è vuoto.
    '''
    return True if interleaving_bk_tag(x, y, z) else False

def interleaving_bk_tag(x, y, z):
    '''
    Se 'z' è un rimescolamento di 'x' e 'y', allora restituisce una lista in
    cui è segnato per ogni elemento in 'z' in quale sequenza appartiene ('x' o
    'y').
    '''

    def genera(i = 0, index_x = 0, index_y = 0):
        if i == 2 * n: # nodo foglia
            return True
        else: # nodo interno
            if index_x < n and z[i] == x[index_x]:
                if genera(i + 1, index_x + 1, index_y):
                    tag[i] = 'x'
                    return True

            if index_y < n and z[i] == y[index_y]:
                if genera(i + 1, index_x, index_y + 1):
                    tag[i] = 'y'
                    return True

        return False

    n = len(x)
    tag = ['-' for _ in range(2 * n)]
    return tag if genera() else []
