
rm(list=ls())

setwd("D:/54 Speech Recog Challenge/DS")

library(seewave)
library(tuneR)

trainDir <- "D:/54 Speech Recog Challenge/DS/Data/train/train/audio/"
classNames <- list.files(trainDir)

#-------------------------------------------------------------------------------

currentFolder <- paste0(trainDir, classNames[2])
currentFileName <- list.files(currentFolder)[2]
currentFile <- readWave(paste(currentFolder, currentFileName, sep="/"))
plot(currentFile)

play(currentFile)

spectro3D(currentFile)


