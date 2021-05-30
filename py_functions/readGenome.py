# This Python file uses the following encoding: utf-8

# if __name__ == "__main__":
#     pass
from PySide2.QtCore import QUrl

def readGenome(filePath):
    genome = ''
    with open(QUrl(filePath).toLocalFile(), 'r') as f:
        for line in f:
            if not line[0] == '>':
                genome += line.rstrip()
    return genome
