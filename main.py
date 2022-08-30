# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys

#import PySide2.QtGui.QtWidgets.QFrame.QAbstractScrollArea.QAbstractItemView.QTreeView
from PySide2.QtGui import QGuiApplication, QPaintDevice
from PySide2.QtQml import QQmlApplicationEngine

from PySide2.QtWidgets import QTreeView,QFileSystemModel,QApplication
from PySide2.QtCore import QObject, Slot, Signal, QTimer, QUrl, QDir, QStringListModel, QAbstractListModel, Qt, QModelIndex

import PySide2.QtMultimedia

class ObjectModel(QAbstractListModel):
    Title = Qt.UserRole + 1
    Source = Qt.UserRole + 2

    #personChanged = pyqtSignal()
    def __init__(self, object):
        super().__init__()
        self.object = object

    def data(self, index, role=Qt.DisplayRole):
        row = index.row()
        if role == ObjectModel.Title:
            return self.object[row]["title"]
        if role == ObjectModel.Source:
            return self.object[row]["source"]

    def rowCount(self, parent=QModelIndex()):
        return len(self.object)

    def roleNames(self):
        return {
            ObjectModel.Title: b'title',
            ObjectModel.Source: b'source'
        }

    #Вернуть по инексу путь
    @Slot(int, result=str)
    def get(self, row):
        if 0 <= row < self.rowCount():
            return self.object[row]["source"]



class ObjectPhoto(QAbstractListModel):
    IdImg = Qt.UserRole + 1
    ImgMin = Qt.UserRole + 2
    ImgNormal = Qt.UserRole + 3

    def __init__(self, object):
        super().__init__()
        self.object = object

    def data(self, index, role=Qt.DisplayRole):
        row = index.row()
        if role == ObjectPhoto.IdImg:
            return self.object[row]["idImg"]
        if role == ObjectPhoto.ImgMin:
            return self.object[row]["imgMin"]
        if role == ObjectPhoto.ImgNormal:
            return self.object[row]["imgNormal"]


    def rowCount(self, parent=QModelIndex()):
        return len(self.object)

    def roleNames(self):
        return {
            ObjectPhoto.IdImg: b'idImg',
            ObjectPhoto.ImgMin: b'imgMin',
            ObjectPhoto.ImgNormal: b'imgNormal'
        }

    #Вернуть по инексу путь
    @Slot(int, result=str)
    def get(self, row):
        if 0 <= row < self.rowCount():
            return self.object[row]["source"]

def DirFile(path):
    objSound = QDir(path)
    filters = ["*.mp3", "*.jpg", "*.mp4"]
    objSound.setNameFilters(filters)
    arreyList = objSound.entryInfoList()
    return arreyList


if __name__ == "__main__":
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.load(os.fspath(Path(__file__).resolve().parent / "qml/main.qml"))


    #Музыка
    soundListMusic = DirFile("sound/music")

    #Модель саундтреки музыки
    modelMusic = ObjectModel(
        [
            {
                'title': soundListMusic[i].baseName(),
                'source': '../../'+soundListMusic[i].filePath()
            }
            for i in range (len(soundListMusic))
        ]
    )


    #Воспоминания
    soundListKubickoy = DirFile("sound/memories/kubickoy")

    #Модель воспоминания
    modelKubickoy = ObjectModel(
        [
            {
                'title': soundListKubickoy[i].completeBaseName(),
                'source': '../../'+soundListKubickoy[i].filePath()
            }
            for i in range (len(soundListKubickoy))
        ]
    )


    #Фотографии
    photoListMin = DirFile("images/photos/min")
    photoListNormal = DirFile("images/photos/normal")
    #Модель фото
    modelPhoto = ObjectPhoto(
        [
            {
                'idImg': i,
                'imgMin': '../../'+str(photoListMin[i].filePath()),
                'imgNormal': '../../'+str(photoListNormal[i].filePath())
            } for i in range (len(photoListNormal))
        ]
    )


    #Фото Маргориты
    margoritaMin = DirFile("images/margarita/min")
    margoritaNormal = DirFile("images/margarita/normal")


    modelMargarita = ObjectPhoto(
        [
            {
                'idImg': i,
                'imgMin': '../../'+str(margoritaMin[i].filePath()),
                'imgNormal': '../../'+str(margoritaNormal[i].filePath())
            } for i in range (len(margoritaMin))
        ]
    )



    #Видео
    videoList = DirFile("video")

    #Модель видео
    modelVideo = ObjectModel(
        [
            {
                'title': videoList[i].baseName(),
                'source': '../../'+videoList[i].filePath()
            }
            for i in range (len(videoList))
        ]
    )

    engine.rootContext().setContextProperty("modelMusic",modelMusic)
    engine.rootContext().setContextProperty("modelKubickoy",modelKubickoy)

    engine.rootContext().setContextProperty("modelMargarita",modelMargarita)

    engine.rootContext().setContextProperty("modelPhoto",modelPhoto)
    engine.rootContext().setContextProperty("modelVideo",modelVideo)


    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
