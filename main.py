# This Python file uses the following encoding: utf-8
import os
import sys

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal, QTimer, QUrl
from py_functions.readGenome import readGenome
from py_functions.scsAlgorithm import scs
from py_functions.readFileAndGetReads import getListOfReads, readFile
from py_functions.gscsAlgorithm import gscs
from py_functions.dbgAlgorithm import DeBruijnGraph, DeBruijnGraph2

class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)
    # Signal is used to send data to interface using function
    # Open File To Text Edit
    readText = Signal(str)

    # Open File
    @Slot(str)
    def openFile(self, filePath):
        file = open(QUrl(filePath).toLocalFile(), encoding="utf-8")
        text = file.read()
        file.close()
        global genome
        genome = readGenome(filePath)
        print(genome[:100])
        self.readText.emit(str(text))

    # Slot for SCS read file
    @Slot(str)
    def readFile(self, filePath):
        lines = readFile(filePath)
        global listOfReads
        listOfReads = []
        listOfReads.extend(getListOfReads(lines))

    setResult = Signal(str)
    # Slot for SCS run File
    @Slot(str)
    def runSCS(self, text):
        result = scs(listOfReads)
        print("HEE HEEE")
        print(str(listOfReads[0]))
        self.setResult.emit(str(result))

    @Slot(str)
    def runGSCS(self, text):
        result = gscs(listOfReads, 2)
        self.setResult.emit(str(result))
    @Slot(str)
    def runDBG(self, text):
        g = DeBruijnGraph(listOfReads, k=3)
        result = g.eulerianWalkOrCycle()
        self.setResult.emit(str(result))
    @Slot(str)
    def runDBGVisual(self, text):
#        result = DeBruijnGraph2(['to_every_thing_turn_turn_turn_there_is_a_season_turn_turn_turn'], 4).to_dot()
#        self.setResult.emit(result)
        print('PIPI')


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()

    # Get Context
    main = MainWindow()
    engine.rootContext().setContextProperty("backend", main)

    # Load QMLFile
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
