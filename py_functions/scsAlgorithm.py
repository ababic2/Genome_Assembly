import itertools
from py_functions.overlapFunction import overlap
from py_functions.readFileAndGetReads import getListOfReads, readFile
from PySide2.QtCore import QUrl

def scs(ss):
    shortest_sup = None
    for ssperm in itertools.permutations(ss):
        sup = ssperm[0]
        for i in range(len(ss) - 1):
            olen = overlap(ssperm[i], ssperm[i + 1], min_length = 1)
            sup += ssperm[i + 1][olen:]
        if shortest_sup is None or len(sup) < len(shortest_sup):
            shortest_sup = sup
    return shortest_sup
