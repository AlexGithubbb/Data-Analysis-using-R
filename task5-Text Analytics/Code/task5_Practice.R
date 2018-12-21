# what is the text analytics
# make it easier to process social data, semistructured data, 
# and unstructured data together to find hidden patterns, trends, and anomalies.
Needed <- c("tm","SnowballCC","RColorBrewer","ggplot2","wordcloud","biclust","igraph","fpc")
install.packages(Needed, dependencies = T)
library("tm")
install.packages("Rcampdf", repos = "http://datacube.wu.ac.at/",type = "source")
setwd("/Users/Alexpower/Desktop/R/task5")
getwd()
reviews <- read.csv("Reviews.csv",stringsAsFactors = FALSE)
head(reviews)
str(reviews)
reviews$text
review_text <- paste(reviews$text, collapse ="")
review_source <- VectorSource(review_text)
corpus <- Corpus(review_source)
writeLines(as.character(corpus))
# Cleaning the text for the Corpus
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, removeWords,stopwords("english"))
dtm <- DocumentTermMatrix(corpus)
dtm2 <- as.matrix(dtm)
frequency <- colSums(dtm2)
frequency <- sort(frequency, decreasing = T)
#head(frequency)
# Plotting a word cloud
install.packages("wordcloud")
library("wordcloud")
words <- names(frequency)
wordcloud(words[1:100], frequency[1:100])


# Analyzing Blog Text Posts
# CreateCorpus
docs <- Corpus(DirSource("textmining"))
docs
# the summary() function gives more details but is not partucularly enlighting.
# Instead, we will examine a particular document in the corpus.
# inspect a particular document
#writeLines(as.character(docs[[30]]))

# Data Cleasing
getTransformations()

# create the toSpace content transformer
toSpace <- content_transformer(function(x,pattern){return(gsub(pattern,"",x))})
docs <- tm_map(docs, toSpace,"-")
docs <- tm_map(docs, toSpace,":")
writeLines(as.character(docs[[30]]))
# Remove punctuation - replace punctuation marks with" "
docs <- tm_map(docs, removePunctuation)
#docs <- tm_map(docs,toSpace,"'")
#docs <- tm_map(docs,toSpace,"'")
#docs <- tm_map(docs,toSpace,"-")
# Transform to lower case(need to wrap in content_transformer)
docs <- tm_map(docs, content_transformer(tolower))
# Strip digits(std transformation, so no need for content_transformer)
docs <- tm_map(docs, removeNumbers)
# remove stopwords using std list in tm
docs <- tm_map(docs, removeWords, stopwords("english"))
# Strip whitespaces(cosmetic?)
docs <- tm_map(docs,stripWhitespace)

# ============Stemming==========
writeLines(as.character(docs[[30]]))
# After stemming
install.packages("SnowballC")
library("SnowballC")
# Stem document
docs <- tm_map(docs, stemDocument)
writeLines(as.character(docs[[30]]))
#lemmatization
docs <- tm_map(docs,content_transformer(gsub),pattern = "organiz", replacement = "organ")
docs <- tm_map(docs,content_transformer(gsub),pattern = "organis", replacement = "organ")
docs <- tm_map(docs,content_transformer(gsub),pattern = "andgovern", replacement = "govern")
docs <- tm_map(docs,content_transformer(gsub),pattern = "inenterpris", replacement = "enterpris")
docs <- tm_map(docs,content_transformer(gsub),pattern = "team-", replacement = "team")

# ============DTM==========(document term matrix)
# creating a DTM in R
dtm <- DocumentTermMatrix(docs)
dtm
# the result shows that this is a 30 x 3970 dimension matrix in which 88% of the rows are 0.
# limit the information displayed, one can inspect a small section of it:
inspect(dtm[1:2,1000:1005]) # this command displays terms 1000 through 1005 in the first two rows of the DTM.Note that your results may differ.
# Mining the corpus
freq <- colSums(as.matrix(dtm)) # convert TDM into a mathematical matrix using the as.matrix().T
                                #To get the frequency of occurence of each word in the corpus, we simply sum over all rows to give column sums
length(freq)
# create sort order(descending)
ord <- order(freq,decreasing = T)
#inspect most frequently occuring terms
freq[head(ord)]
#inspect least frequently occuring terms
freq[tail(ord)]
# remove some useless words like"one", "can" ,.. by enforcing bounds when creating the DTM:
dtmr <- DocumentTermMatrix(docs,control = list(wordLengths= c(4,20),bounds=list(global=c(3,27))))
# inspecting the new DTM
dtmr
# Mining the corpus
freqr <- colSums(as.matrix(dtmr))
#length should be total number of terms
length(freqr)
ordr <- order(freqr,decreasing = T)
#inspect most frequently occuring terms
freqr[head(ordr)]
#inspect least frequently occuring terms
freqr[tail(ordr)]
# using findFreqTerms() function to get a list of terms that occur at least xxx times:
findFreqTerms(dtmr,lowfreq = 80) # however, the result is ordered alphabetically, not by frequency
# using findAssos() to list iterms by frequency
findAssocs(dtmr,"project",0.6) # a correlation limit of 0.6 will return terms that have a search 
                               #term co-occurrence of at least 60% and so on.
findAssocs(dtmr,"enterpris",0.6)

# Frequency Histogram
wf = data.frame(term=names(freqr),occurrences=freqr)
library(ggplot2)
p<- ggplot(subset(wf,freqr>100))
plot(p)
