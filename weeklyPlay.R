# Dec 3rd, 2016

library(knitr)
set.seed(123)
rnorm(5)

install.packages('feather')
library(feather)

setwd("C:/Users/tracy.shen/Dropbox (Personal)/Data Tools learning/Python/Intro to Python/course1_downloads")

typeof(mean)
is.primitive(mean)
typeof(sum)
is.primitive(sum)

is.object(sum)
# FALSE indicates that sum is a base type. because base type is not considered as an object-oriented system in R. S4 always should have object in there. 

#> typeof(mean)
# [1] "closure"
# > is.primitive(mean)
# [1] FALSE
# > typeof(sum)
# [1] "builtin"
# > is.primitive(sum)
# [1] TRUE 

# typeof and storage.mode or mode is used to differentiate if an object is a base type. 

install.packages('pryr')

library(pryr)

df <- data.frame(x = 1:10, y = letters[1:10])#x and y is a column name
df
otype(df)    # A data frame is an S3 class
#> [1] "S3"
otype(df$x)  # A numeric vector isn't
#> [1] "base"
otype(df$y)  # A factor is
#> [1] "S3"

ftype(t.test)
# [1] "s3"      "generic"

install.packages('RSQLite')
library(RSQLite)#it's an interface for SQLite DBMS to R
library(DBI) #used to connect to a database

con=dbConnect(RSQLite::SQLite(),dbname=':memory:')# the memory doesn't contain mtcars

con <- dbConnect(RSQLite::SQLite()) #just establish connection without connect to a certain database

# check to see if my database has any file, it turns out to be none. 
tables=dbSendQuery(con, 'SELECT * FROM sqlite_master')
tables
# <SQLiteResult>
# SQL  SELECT * FROM sqlite_master
# ROWS Fetched: 0 [complete]
# Changed: 0


dbListTables(con)
dbWriteTable(con, "mtcars", mtcars)
dbListTables(con)

dbListFields(con, "mtcars")
dbReadTable(con, "mtcars")

res <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")#this can query rows that has cyl=4



# ==============================Qualtrics API plugin=====
devtools::install_github("JasperHG90/qualtRics")#this doens't work
install.packages('curl')
install.packages("qualtRics")
install.packages('stringi')
library(qualtRics)
library(curl)
registerApiKey(API.TOKEN='SmhYzzYV9MVjSYgctgSTxQZyyZshCDgww9x135lo')
register
surveys=getSurveys(root_url ="https://accuweather.az1.qualtrics.com")

mysurvey=getSurvey(surveyID = surveys$id[9],format = 'csv',root_url ="https://accuweather.az1.qualtrics.com",verbose = T)

# survey3=getSurvey(surveyID = 'SV_d1e8iVxFUxpENkV',format = 'csv',root_url ="https://accuweather.az1.qualtrics.com",verbose = T)

write.csv(mysurvey,"brandsurvey.csv",row.names = F)
write.csv(surveys,"surveylist.csv",row.names = F)
# ====week 12/17/2016====
library(datasets)
str(iris)
library(tidyr)
# get first observation for each Species in iris data -- base R
mini_iris <- iris[c(1, 51, 101), ]
mini_iris
#      Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
# 1            5.1         3.5          1.4         0.2     setosa
# 51           7.0         3.2          4.7         1.4 versicolor
# 101          6.3         3.3          6.0         2.5  virginica
# so gather is different from unpivoting. unpivoting has to be done on the same name column. but gather can create a grouped name to aggregate multiple columns togehter (called key) and make their value just be value (called value). 
# gather Sepal.Length, Sepal.Width, Petal.Length, Petal.Width
gather(mini_iris, key = flower_att, value = measurement,
       Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
# same result but less verbose, this is alternative way to do it by minus the species column. 

gather(mini_iris, key = flower_att, value = measurement, -Species)

# see reproducible study in rmd file. 

install.packages("broom")
install.packages("rvest")
install.packages("pixiedust")


p=read_html("http://www.everyoneweb.com/worldpenissize")
# it didn't work anymore, instead, the author included into a dataset package. 
devtools::install_github("tadaadata/loldata")
install.packages("tadaadata/loldata")

# =================Dec 25th, 2015++Merry Xmas!!++==========================
install.packages('httr')
library(httr)
R.version#use it as a variable to acquire the r version of it.

x=GET('https://google.com')
x$status_code
x$headers
x$cookies
x$content #binary output
y=POST("https://google.com")
y$url
y$status_code
y$headers
y$content
HEAD('https://google.com')
PATCH('https://google.com') #similar to PUT function

x=GET("https://httpbin.org/get")
x$status_code
x$headers
y=POST("https://httpbin.org/post")
y$status_code
content(x)
x$headers #it's a list, you can call the items in it by using [[x]] or just use the item name like below. 
x$headers$`content-type`
x$headers$`content-length`
x$headers$connection
x$headers$`access-control-allow-origin`
x$headers$date
x$headers$`access-control-allow-credentials`
 
x$headers[[1]]
x$headers[[2]]
x$headers[[3]]

# ====
# send a request with a query meter, header, body

# Request with query parameters
x <- GET(url, query = list(a = 5))
# Request with headers
x <- GET(url, add_headers(wave = "hi"))
# Request with a body
x <- POST(url, body = list(a = 5))

x <- GET("https://google.com", add_headers(wave = "hi"))
x$headers
x$headers$`content-type`

j1= GET("http://www.omdbapi.com/?t=iron%20man%202&r=json")
content(j1, as = "text") #text will give you all the clustered information in text format
content(j1, as = "parsed") #parsed will give you information in a clean lay-out


# ====1/22/2017 counting down to Spring Festival====
library(httr)

# x=GET("http://dataservice.accuweather.com/forecasts/v1/daily/5day/335315?apikey=Yswj9aNofL4VcnD29ELGoNVjYcI2ve4b&language=en-us&details=true")
# x

# install.packages('twitteR')
library(twitteR)
# install.packages('ROAuth')
install.packages("SchedulerR")
library(ROAuth)
setup_twitter_oauth('U8zO8017TOxLAt5GKx5oLv4c5','jLecbFgIYHMtTV6DvqpDnqTJ4A6C0AN1OHVC75VWnijsqX3xI4',access_token = NULL,access_secret = NULL)


api_key <- "U8zO8017TOxLAt5GKx5oLv4c5"
api_secret <- "jLecbFgIYHMtTV6DvqpDnqTJ4A6C0AN1OHVC75VWnijsqX3xI4"
access_token <- "	878214482-QUAZFSWCgNbZ4cxnw4FPAIRjSqpH1YuP9Hdllu7n"
access_token_secret <- "4gxrCy9bbiCxgaCOr2Et6RiOOjnxm1rYDiFmB6BcGIto3"
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
setwd("C:/Users/tracy.shen/Dropbox (Personal)/Data Tools learning/API Connection")
# Download "cacert.pem" file
download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")

#create an object "cred" that will save the authenticated object that we can use for later sessions
cred <- OAuthFactory$new(consumerKey='U8zO8017TOxLAt5GKx5oLv4c5',
                         consumerSecret='jLecbFgIYHMtTV6DvqpDnqTJ4A6C0AN1OHVC75VWnijsqX3xI4',
                         requestURL='https://api.twitter.com/oauth/request_token',
                         accessURL='https://api.twitter.com/oauth/access_token',
                         authURL='https://api.twitter.com/oauth/authorize')

# Executing the next step generates an output --> To enable the connection, 
# please direct your web browser to: <hyperlink> . Note:  You only need to do this part once
cred$handshake(cainfo="cacert.pem")
#save for later use for Windows
save(cred, file="twitter authentication.Rdata")

library(httpuv)
library(openssl)

OAuthFactory$new(consumer_key=)
load("twitter authentication.Rdata")
setup_twitter_oauth(cred,access_token = NULL,access_secret = NULL)

search.string <- "#nba"
no.of.tweets <- 100

tweets <- searchTwitter(search.string, n=no.of.tweets, cainfo="cacert.pem", lang="en")
tweets

# ===Coursera way====
oauth_endpoints("twitter")
myapp=oauth_app("twitter",key="U8zO8017TOxLAt5GKx5oLv4c5",secret = "jLecbFgIYHMtTV6DvqpDnqTJ4A6C0AN1OHVC75VWnijsqX3xI4")

twitter_token=oauth1.0_token(oauth_endpoints("twitter"),myapp)
# sig=config(myapp, token = "878214482-QUAZFSWCgNbZ4cxnw4FPAIRjSqpH1YuP9Hdllu7n",token_secret="4gxrCy9bbiCxgaCOr2Et6RiOOjnxm1rYDiFmB6BcGIto3")
# homeTL = GET("https://api.twitter.com/1.1/search/tweets.json", sig)

# ====web crowling=====================================================================
url="http://www.theguardian.com/uk-news/2014/mar/10/rise-zero-hours-contracts"
target=paste0("http://urls.api.twitter.com/1/urls/count.json?url=",url)
target
rd <- readLines(target, warn="F") 
dat <- fromJSON(rd)
dat
library(jsonlite)
url="http://www.theguardian.com/uk-news/2014/mar/10/rise-zero-hours-contracts"
target=paste0("http://www.stumbleupon.com/services/1.01/badge.getinfo?url=",url)
rd <- readLines(target, warn="F") 
dat <- fromJSON(rd)
dat

# ======Hadley's DEMO==================
# 1. Find OAuth settings for twitter:
#    https://dev.twitter.com/docs/auth/oauth
oauth_endpoints("twitter")
# <oauth_endpoint>
# request:   https://api.twitter.com/oauth/request_token
# authorize: https://api.twitter.com/oauth/authenticate
# access:    https://api.twitter.com/oauth/access_token


# 2. Register an application at https://apps.twitter.com/
#    Make sure to set callback url to "http://127.0.0.1:1410/"
#
#    Replace key and secret below
# myapp <- oauth_app("twitter",
#                    key = "2xHGxrsXiPmCN381odNUjwUZZ",
#                    secret = "XfXjfi1EEa0f3Iy0nAsEFgE5KsKzNUXpMs2bMTCp8zOF7TrPxl"
# )


myapp=oauth_app("twitter",key="U8zO8017TOxLAt5GKx5oLv4c5",secret = "jLecbFgIYHMtTV6DvqpDnqTJ4A6C0AN1OHVC75VWnijsqX3xI4")

# 3. Get OAuth credentials
twitter_token <- oauth1.0_token(oauth_endpoints("twitter"), myapp)

# 4. Use API
req <- GET("https://api.twitter.com/1.1/statuses/home_timeline.json",
           config(token = twitter_token))
stop_for_status(req)#to convert http error to R error so that we know why the request failed
unlist(content(req))
content(req)

# ===DEMO END==========================


# ====2nd DEMO====
# 1. Find OAuth settings for twitter:

# https://dev.twitter.com/docs/auth/oauth

oauth_endpoints("twitter")

# 2. Register an application at https://apps.twitter.com/

# Make sure to set callback url to "http://127.0.0.1:1410/"

#

# Replace key and secret below

myapp <- oauth_app("twitter",
                   
                   key = "TYrWFPkFAkn4G5BbkWINYw",
                   
                   secret = "qjOkmKYU9kWfUFWmekJuu5tztE9aEfLbt26WlhZL8"
                   
)

# 3. Get OAuth credentials

twitter_token <- oauth1.0_token(oauth_endpoints("twitter"), myapp)

# 4. Use API

req <- GET("https://api.twitter.com/1.1/statuses/home_timeline.json",
           
           config(token = twitter_token))

stop_for_status(req)

content(req)


# ===2nd DEMO END===

# NOW HAVE SOME FUN ANALYSIS
install.packages('twitteR')

library(twitteR)
library(ggplot2)
library(httr)
library(rjson)
library(tm)
library(gridExtra)
library(lubridate)
 
# connect to a twitter app and download tweets from there. 
setwd("C:/Users/tracy.shen/Dropbox (Personal)/IST Degrees/fakeNews/Datasets/twitter")
#Type in your app details from Twitter here:
API_key="2xHGxrsXiPmCN381odNUjwUZZ"
API_secret='XfXjfi1EEa0f3Iy0nAsEFgE5KsKzNUXpMs2bMTCp8zOF7TrPxl'
access_token="878214482-n8mUjb5cbbrkYTzG9EAo76ICORt1maJ5c421xStH"
access_secret="M4anl1LqP0yXtUtNArjM4fGRvcNBIlu2dK18nLqv6xhPP"
setup_twitter_oauth(API_key, API_secret,
                    access_token, access_secret)
# 
#Extract tweets from a single user at a time  
clinton_tweets <- userTimeline(user = "@HillaryClinton",
                               n = 200, includeRts = FALSE, retryOnRateLimit = 2000)
trump_tweets <- userTimeline(user = "@realDonaldTrump",
                             n = 200, includeRts = FALSE, retryOnRateLimit = 2000)  

#Put the tweets downloaded into a data.frame
clinton_tweets <- twListToDF(clinton_tweets)
trump_tweets <- twListToDF(trump_tweets)

rdmTweets <- searchTwitter('#mozfest', n=60)
rdmTweets=twListToDF(rdmTweets)
weatherTweets=searchTwitter('#weather',n=60)
weatherTweets=twListToDF(weatherTweets)
write.csv(clinton_tweets,"clinton_tweets.csv",row.names = F)
write.csv(trump_tweets,"trump_tweets.csv",row.names = F)
write.csv(rdmTweets,"mozfest.csv",row.names = F)
write.csv(weatherTweets,"weatherMentions.csv",row.names = F)

# ===download twitter documents with replies=================
clinton_tweets <- userTimeline(user = "@HillaryClinton",
                               n = 200, includeRts = FALSE, retryOnRateLimit = 2000,excludeReplies = FALSE)

clinton_tweets <- twListToDF(clinton_tweets)
write.csv(clinton_tweets,"clinton_tweets1.csv",row.names = F)
#Remove punctuation, numbers, html-links and unecessary spaces:
textScrubber <- function(dataframe) {
  
  dataframe$text <-  gsub("-|_", " ", dataframe$text)
  dataframe$text <-  gsub("&", " ", dataframe$text)
  dataframe$text <-  gsub("[[:punct:]]", " ", dataframe$text)
  dataframe$text <-  gsub("[[:digit:]]", " ", dataframe$text)
  dataframe$text <-  gsub("https://.+", " ", dataframe$text)
  dataframe$text <-  gsub("\n", " ", dataframe$text)
  dataframe$text <-  gsub("[ \t]{2,}", " ", dataframe$text)
  dataframe$text <-  gsub("^\\s+|\\s+$", " ", dataframe$text)
  dataframe$text <-  tolower(dataframe$text)
  
  return(dataframe)
}

tdmCreator <- function(dataframe, stemDoc = T, rmStopwords = T){
  
  tdm <- Corpus(VectorSource(dataframe$text))
  if (isTRUE(rmStopwords)) {
    tdm <- tm_map(tdm, removeWords, stopwords())
  }
  if (isTRUE(stemDoc)) {
    tdm <- tm_map(tdm, stemDocument)
  }
  tdm <- TermDocumentMatrix(tdm,
                            control = list(wordLengths = c(1, Inf)))
  tdm <- rowSums(as.matrix(tdm))
  tdm <- sort(tdm, decreasing = T)
  df <- data.frame(term = names(tdm), freq = tdm)
  return(df)
}

clinton_tweets=tdmCreator(clinton_tweets)
trump_tweets=tdmCreator(trump_tweets)


#Selects the 15 most used words.
trump_tweets <- trump_tweets[1:15,]
clinton_tweets <- clinton_tweets[1:15,]

#Create bar graph with appropriate colours
#and use coord_flip() to help the labels look nicer.
trump_plot <- ggplot(trump_tweets, aes(x = reorder(term, freq), y = freq)) +
  geom_bar(stat = "identity", fill = "red") +
  xlab("Most Used") + ylab("How Often") +
  coord_flip() + theme(text=element_text(size=25,face="bold"))

clinton_plot <- ggplot(clinton_tweets, aes(x = reorder(term, freq), y = freq)) +
  geom_bar(stat = "identity", fill = "blue") +
  xlab("Most Used") + ylab("How Often") +
  coord_flip() + theme(text=element_text(size=25,face="bold"))

#There are other ways to get these plots
#side-by-side, but this is easy.
grid.arrange(trump_plot, clinton_plot, ncol=2)


#Download tweets from a group of people specified in a Twitter list.
tweetsFromList <- function (listOwner, listName,
                            sleepTime = 7, n_tweets = 200, includeRts = F) {
  
  api_url <- paste0("https://api.twitter.com/1.1/lists/members.json?slug=",
                    listName, "&owner_screen_name=", listOwner, "&count=5000")
  #Pull out the users from the list
  response <- GET(api_url, config(token=twitteR:::get_oauth_sig()))
  response_data <- fromJSON(content(response, as = "text", encoding = "UTF-8"))
  #If you want a list of their profile names,
  #then remove the hashtag underneath and
  #add it to the return statement at the bottom (use a list).
  #Useful if you need to verify identity of people.
  
  #user_title <- sapply(response_text$users, function(i) i$name)
  user_names <- sapply(response_data$users, function(i) i$screen_name)
  tweets <- list()
  
  #Loops over list of users, use rbind() to add them to list.
  #Sys.sleep ticks in between to avoid the rate limit.
  for (user in user_names) {
    ## Download user's timeline from Twitter  
    raw_data <- userTimeline(user, n = n_tweets,
                             includeRts = includeRts,
                             retryOnRateLimit = 2000)
    if (length(raw_data) != 0L) {
      tweets <- rbind(tweets, raw_data)
      print('Sleeping to avoid rate limit')
      Sys.sleep(sleepTime);
      #If a Twitter-user has no tweets,
      #userTimeline and rbind fails.
      #The if-else statement solves this.
    }
    else {
      next
    }
    
  }
  rm(raw_data)
  tweets <- twListToDF(tweets)
  
  return(tweets)
}
# Hold alt and drag your cursor to type on multiple lines

# i don't want to say it'
# i don't want to say it'
# 


# ===1/30/2017====

# Metro System change

library(dplyr)
library(tidyr)
library(ggmap)

data = read.table("https://raw.githubusercontent.com/pagepiccinini/blog/master/2016-09-27_metros/data_metros.txt", header=T, sep="\t") %>%
unite(geo_location, c(station, location), sep = ", ", remove = FALSE) %>%
separate(opened, into = c("opened_month", "opened_day", "opened_year"), sep = "/") %>%
mutate_geocode(geo_location, source = "google")

data <- read.table("https://raw.githubusercontent.com/pagepiccinini/blog/master/2016-09-27_metros/data_metro_full.txt", header=T, sep="\t")
head(data)
# city                             geo_location                 location         station line
# 1 Paris                  Abbesses, Paris, France            Paris, France        Abbesses   12
# 2 Paris                    Alésia, Paris, France            Paris, France          Alésia    4
# 3 Paris           Alexandre Dumas, Paris, France            Paris, France Alexandre Dumas    2
# 4 Paris            Alma - Marceau, Paris, France            Paris, France  Alma - Marceau    9
# 5 Paris Anatole France, Levallois-Perret, France Levallois-Perret, France  Anatole France    3
# 6 Paris                    Anvers, Paris, France            Paris, France          Anvers    2
# opened_month opened_day opened_year      lon      lat
# 1           10         31        1912 2.338559 48.88430
# 2           10         30        1909 2.327058 48.82820
# 3            1         31        1903 2.394419 48.85633
# 4            5         27        1923 2.352222 48.85661
# 5            9         24        1937 2.284904 48.89223
# 6           10          7        1902 2.344253 48.88285

paris_map = get_googlemap(center = "Paris", maptype = "roadmap",
                          zoom = 11, size = c(640, 420), color = "bw")

berlin_map = get_googlemap(center = "Berlin", maptype = "roadmap",
zoom = 10, size = c(640, 420), color = "bw")

barcelona_map = get_googlemap(center = "Barcelona", maptype = "roadmap",
zoom = 11, size = c(640, 420), color = "bw")

prague_map = get_googlemap(center = "Prague", maptype = "roadmap",
zoom = 11, size = c(640, 420), color = "bw")

city_plot = function(city_name, city_map){
  ggmap(city_map, extent = "device") +
    geom_point(data = subset(data, city == city_name), aes(x = lon, y = lat),
               color = "#0571b0", size = 3)
}

paris.plot = city_plot("Paris", paris_map)
paris.plot