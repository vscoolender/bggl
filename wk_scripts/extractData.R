set.seed(2017)
gv_tagger = worker("tag")
gv_tagger$symbol=T
bgglDs<-fread("../data/bggl.csv",colClasses=c(rep("NULL",2),NA,rep("NULL",22)))
 
targetFile<-"../r_workdir/preprocessed.txt"
rawTargetFile <-"../r_workdir/raw_preprocessed.txt"


#remove duplicated rows
dupIdx.bggl<-duplicated(bgglDs$变更标题)
rd.bggl<-bgglDs[!dupIdx.bggl,]
s_bgglDs<-head(rd.bggl,100)
s_bgglDs<-rd.bggl
#show_dictpath()


#clear target file

cat('',file=targetFile,append=F)
cat('',file=rawTargetFile,append=F)
preMarkedTag<-"O"
apply(s_bgglDs,1,vs.nlp.preprocDs,1,targetFile,vs.nlp.preNer.sentHandler,rawTargetFile,preMarkedTag)

crfFile<-"../corpus/bgNer.base.train"
crfDs<-vs.data.crf.check(crfFile,2)

