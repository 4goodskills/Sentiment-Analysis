install.packages("twitteR")
library(stringr)
library(twitteR)
library(xlsx)
library(plyr)
api_key <- "CCC2wkwqiPHm1fHKcN2XDLBgS" #in the quotes, put your API key 
api_secret <- "y6RR4ILSxSjFdGOxRJW3yG8n68GWiUhDL8chtZ6GqnVc2zdVRy" #in the quotes, put your API secret token 
token <- "903798402894274560-QLcDbEC16QOwpo2LIFjCCVjvyWarsly" #in the quotes, put your token 
token_secret <- "Otd5rCWZ9ELiPqZLRjLBAX6Jq6sB7pbKer5h0mrqMKFUA" #in the quotes, put your token secret
setup_twitter_oauth(api_key, api_secret, token, token_secret)
setwd("/Users/patriciamorillorios/Desktop/Sentiment/SentimentR")
neg = scan("negative-words.txt", what="character", comment.char=";")
pos = scan("positive-words.txt", what="character", comment.char=";")

tweets = searchTwitter("#samesexmarriage", n=1000)
#tweets.df <- twListToDF(tweets)
#write.csv(tweets.df, "/Users/patriciamorillorios/Desktop/Sentiment/SentimentR/tweets.csv")
Tweets.text = laply(tweets,function(t)t$getText())
analysis = score.sentiment(Tweets.text, pos, neg)
hist(analysis$score)
