#preprocess each document as the following steps:
vs.nlp.preprocDs<-function(itemDs,contentIdx,targetFile,sentHandler,rawTargetFile=NULL,preMarkedTag=NULL){
  
  item<-as.character(itemDs[contentIdx])
  if(vs.trim(item)==''){
    return
  }
  
  #split sentences.
  #cat(class(item))
 
  sents<-vs.split.bySent(item)
  
  #print(sents)
  if (!is.null(rawTargetFile)){
     lapply(sents,function(x){
       if(vs.trim(x)!='') {
         cat(x,file=rawTargetFile,append=T,fill=T) 
       }
      })
   cat("\n",file=rawTargetFile,append=T,fill=F) 
  }
   lapply(sents,sentHandler,targetFile,preMarkedTag)
  cat("\n",file=targetFile,append=T,fill=F) 
}

#Preprocess every sentence.The workflow is as the following:
#1)remove all empty characters in the sentence
#2)segment and pos
#3) pre-mark tag for every word if preMarkedTag is defined
#4)output into target file

vs.nlp.preNer.sentHandler<-function(sentence,targetFile,preMarkedTag=NULL){
  it<-vs.trim.all(sentence)
  
  if(it=='') {
    return
  }
   tags<-gv_tagger<=it
   for (i in seq_along(tags)){
     #  print(tags[i])  
     
     #print(attributes(tags[i])$names)
      itTag<-tags[i]
      itPos<-(attributes(itTag))$names
      if(is.null(preMarkedTag)){
        item<-str_c(itTag," ",itPos)  
      }
      else{
        item<-str_c(itTag," ",itPos," ",preMarkedTag)
      }
      cat(item,file=targetFile,append=T,fill=T)
      
   }
   #append newline for each sentence
   cat("\n",file=targetFile,append=T,fill=F) 
}

 

#check elements' number of every row in the crf++ template file.
vs.data.crf.check<-function(crfFile,standNum){
  rslt<-list()
  crfDs<-readLines(crfFile)
  for(i in 1:length(crfDs)){
    item<-crfDs[i]
    count<-str_count(item," ");
    if (item!=''&& count!=standNum){
      print(str_c("Line No:",i,"[count:",count,"]:",item))
      append(rslt,item)
    }
  }
  return (rslt)
}