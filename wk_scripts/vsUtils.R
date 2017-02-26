vs.trim.leading <- function (x)  sub("^\\s+", "", x)

# returns string w/o trailing whitespace
vs.trim.trailing <- function (x) sub("\\s+$", "", x)

# returns string w/o leading or trailing whitespace
vs.trim <- function (x) gsub("^\\s+|\\s+$", "", x)
vs.trim.all<-function(x){
  #str_replace_all(x, fixed(" "), "")
  gsub("[[:space:]]", "", x)
}
vs.split.bySent <- function (text) {
  
  # split based on periods, exclams or question marks
  #result <- unlist (strsplit (text, split = "[\\,.!?？，。！]+"))
  result <- unlist (strsplit (text, split = "[\\,!?？，。！]+"))
  
  
  # do not return empty strings
  result <- vs.trim (result)
  result <- result [nchar (result) > 0]
  
  # ensure that something is always returned
  if (length (result) == 0)
    result <- ""
  
  return (result)
}
