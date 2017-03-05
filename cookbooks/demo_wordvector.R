library(wordVectors)
prep_word2vec("cookbooks","cookbooks.txt",lowercase=T)
model = train_word2vec("cookbooks.txt",output="cookbook_vectors.bin",threads = 3,vectors = 100,window=12)