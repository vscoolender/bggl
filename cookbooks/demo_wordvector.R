library(wordVectors)
library("tsne")
library("jiebaR")
library(stringr)
library("data.table")
library("fpc")
library("coreNLP")
setwd("D:/work/projs/dmprojs/zcgl/test_data")


prep_word2vec("cookbooks","cookbooks.txt",lowercase=T)
model = train_word2vec("cookbooks.txt",output="cookbook_vectors.bin",threads = 3,vectors = 100,window=12)
nearest_to(model,model[["fish"]])
