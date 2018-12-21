#=========================================

# Task5 Exercise 6: cleaning the text for corpus
corpus <- tm_map(corpus, content_transformer(tolower)) # covert to lower case
corpus <- tm_map(corpus, removeNumbers) # remove numbers
corpus <- tm_map(corpus, removePunctuation) # remove punctuation
corpus <- tm_map(corpus, stripWhitespace) # Strip whitespace
inspect(corpus[1:3])

#=========================================