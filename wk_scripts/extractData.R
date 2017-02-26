set.seed(2017)
bgglDs<-fread("../data/bggl.csv",colClasses=c(rep("NULL",7),NA,rep("NULL",17)))
 
targetFile<-"../r_workdir/preprocessed.txt"
rawTargetFile <-"../r_workdir/raw_preprocessed.txt"

gv_tagger = worker("tag")
gv_tagger$symbol=T
#remove duplicated rows
dupIdx.bggl<-duplicated(bgglDs$变更描述)
rd.bggl<-bgglDs[!dupIdx.bggl,]
s_bgglDs<-head(rd.bggl,100)
s_bgglDs<-bgglDs


#clear target file

cat('',file=targetFile,append=F)
cat('',file=rawTargetFile,append=F)
preMarkedTag<-"O"
apply(s_bgglDs,1,vs.nlp.preprocDs,targetFile,vs.nlp.preNer.sentHandler,rawTargetFile,preMarkedTag)

crfFile<-"../r_workdir/bgNer.train"
crfDs<-vs.data.crf.check(crfFile,2)

