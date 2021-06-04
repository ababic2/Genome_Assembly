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

def gscs(ss):

