# This Python file uses the following encoding: utf-8
import os
import sys

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal, QTimer, QUrl
from py_functions.readGenome import readGenome

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
        genome = readGenome(filePath)
        print(genome[:100])
        self.readText.emit(str(text))

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
