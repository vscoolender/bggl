vs.word2vec.prep<-function(ds,contentIdx,targetFile,segWorker){
  apply(ds,1,vs.word2vec.prepSection,contentIdx,targetFile,segWorker)
}

vs.word2vec.prepSection<-function(section,contentIdx,targetFile,segWorker){
  item<-as.character(section[contentIdx])
  if(vs.trim(item)==''){
    return
  }
  
  sents<-vs.split.bySent(item)
  
  lapply(sents,vs.word2vec.sentHandler,targetFile,segWorker)
 # cat("\n",file=targetFile,append=T,fill=F) 
}

vs.word2vec.sentHandler<-function(sentence,targetFile,segWorker){
  it<-vs.trim.all(sentence)
  
  if(it=='') {
    return
  }
 
 
 tokens<-segWorker[it]
 line<-paste(tokens)
 #line<-iconv(line,from="ISO-8859-1",to="gbk")
 cat(line,file=targetFile,append=T,fill=F)
 
}

