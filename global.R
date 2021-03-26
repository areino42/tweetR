

# Librerias

library(twitteR)
library(ROAuth)
library(DT)
library(NLP)
library(tm)
library(ggplot2)
library(plotly)
library(RColorBrewer)
library(wordcloud)
library(graph)
library(Rgraphviz)
library(sqldf)
library(shinyjs)
library(topicmodels)
library(data.table)
library(shinythemes)
library(cluster) 
library(factoextra)

# Load twitter authorization

runOnline = T

if(runOnline){
  
  consumer_key <- "sND9YeQYqRYLntszDVjsXxmj3"
  consumer_secret <- "s0rzIpAGACy3sO7upRCtZVvLtiayqRJRCqcssvG6mG6EAaR6mZ"
  access_token <- "925069954113826817-YXOJ3KdLwcvUMj7TbVPQ5kJQMHt7T9F"
  access_token_secret <- "cLNsUZwqWRXHkzlNWJsAQ2BN8k5SRuHNlIRhin2MFRCGi"
  setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_token_secret)
  options(httr_oauth_cache=T)
  
}

# Startdate

today <- Sys.Date()
since <- as.character(today - 7)
until <- as.character(today)



# Functions

#Remover Retwitters
removeRetweet <- function(x) gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", x)

#Remover usuarios
removeUser <- function(x) gsub("@[[:alnum:]]*", "", x)

#remove hashtags 
removeHashtags  <- function(x) gsub("#\\S*","",x)

#Remover enlaces
removeURL <- function(x) gsub("http[^[:space:]]*", "", x) 

#Remover puntuaciones
removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x)

#Stopwords
myStopwords <- c(stopwords('spanish'))

#Stopwords personalizadas
sw <- readLines("stopwords.txt",encoding="")

#Replace oldword with newword
replaceWord <- function(corpus, oldword, newword) {
  tm_map(corpus, content_transformer(gsub),
         pattern=oldword, replacement=newword)
}




