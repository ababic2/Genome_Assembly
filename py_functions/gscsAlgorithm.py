import itertools
from PySide2.QtCore import QUrl
from py_functions.overlapFunction import overlap
from py_functions.readFileAndGetReads import getListOfReads, readFile

def max_overlap(reads, k):
    readA, readB = None, None
    bestOverlapLength = 0
    for a, b in itertools.permutations(reads, 2):
        currentOverlapLength = overlap(a,b, min_length = k)
        if currentOverlapLength > bestOverlapLength:
            readA, readB = a, b
            bestOverlapLength = currentOverlapLength
    return readA, readB, bestOverlapLength

def gscs(reads, k):
    readA, readB, olen = max_overlap(reads, k)
    while olen > 0:
        reads.remove(readA)
        reads.remove(readB)
        reads.append(readA + readB[olen:])
        readA, readB, olen = max_overlap(reads, k)
    return ''.join(reads)
