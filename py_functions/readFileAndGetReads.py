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
