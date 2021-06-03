import itertools
from PySide2.QtCore import QUrl

def readFile(filePath):
    file = open(QUrl(filePath).toLocalFile(), encoding="utf-8")
    lines = file.readlines()
    file.close()
    return lines

def getListOfReads(lines):
    readList = []
    for line in lines:
        readList += [line.strip()]
    return readList

def overlap(a, b, min_length = 3):
    start = 0
    while True:
        start = a.find(b[:min_length], start)
        if start == -1:
            return 0
        if b.startswith(a[start:]):
            return len(a) - start
        start += 1

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
