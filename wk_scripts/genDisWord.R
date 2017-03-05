library(wordVectors)
library("tsne")
library("jiebaR")
library(stringr)
library("data.table")
library("fpc")
library("coreNLP")

set.seed(2017)
segWorker<-worker()
w2v_targetFile<-"../r_workdir/prep_word2vec.txt"


bgglDs<-fread("../data/bggl.csv",colClasses=c(rep("NULL",2),NA,rep("NULL",22)))
dupIdx.bggl<-duplicated(bgglDs$变更标题)
rd.bggl<-bgglDs[!dupIdx.bggl,]
s_bgglDs<-head(rd.bggl,100)
#s_bgglDs<-rd.bggl

cat('',file=w2v_targetFile,append=F)
vs.word2vec.prep(s_bgglDs,1,w2v_targetFile,segWorker)

model = train_word2vec(w2v_targetFile,output="w2v_bggl.model",threads = 3,vectors = 100,window=12,force = T)
nearest_to(model,model[["公司"]])
