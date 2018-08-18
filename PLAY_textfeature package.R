install.packages("textfeatures")
library(textfeatures)
## the text of five of Trump's most retweeted tweets
trump_tweets <- c(
  "#FraudNewsCNN #FNN https://t.co/WYUnHjjUjg",
  "TODAY WE MAKE AMERICA GREAT AGAIN!",
  paste("Why would Kim Jong-un insult me by calling me \"old,\" when I would",
        "NEVER call him \"short and fat?\" Oh well, I try so hard to be his",
        "friend - and maybe someday that will happen!"),
  paste("Such a beautiful and important evening! The forgotten man and woman",
        "will never be forgotten again. We will all come together as never before"),
  paste("North Korean Leader Kim Jong Un just stated that the \"Nuclear",
        "Button is on his desk at all times.\" Will someone from his depleted and",
        "food starved regime please inform him that I too have a Nuclear Button,",
        "but it is a much bigger &amp; more powerful one than his, and my Button",
        "works!")
)
trump_tweets
# below is the five sentences that Trump tweeted. the comma is to separate the sentences and join them together
# [1] "#FraudNewsCNN #FNN https://t.co/WYUnHjjUjg"                                                                                                                                                                                                                                                    
# [2] "TODAY WE MAKE AMERICA GREAT AGAIN!"                                                                                                                                                                                                                                                            
# [3] "Why would Kim Jong-un insult me by calling me \"old,\" when I would NEVER call him \"short and fat?\" Oh well, I try so hard to be his friend - and maybe someday that will happen!"                                                                                                           
# [4] "Such a beautiful and important evening! The forgotten man and woman will never be forgotten again. We will all come together as never before"                                                                                                                                                  
# [5] "North Korean Leader Kim Jong Un just stated that the \"Nuclear Button is on his desk at all times.\" Will someone from his depleted and food starved regime please inform him that I too have a Nuclear Button, but it is a much bigger &amp; more powerful one than his, and my Button works!"

## get the text features of a character vector
textfeatures(trump_tweets)
## data frame with a character vector named "text"
df <- data.frame(
  id = c(1, 2, 3),
  text = c("this is A!\t sEntence https://github.com about #rstats @github",
           "doh", "The following list:\n- one\n- two\n- three\nOkay!?!")
)

## get text features of a data frame with "text" variable
textfeatures(df)

# below is the result
# n_chars n_commas n_digits n_exclaims n_extraspaces n_hashtags n_lowers n_lowersp n_mentions
# 1      21        0        0          1             3          1       18 0.8636364          1
# 2       3        0        0          0             0          0        3 1.0000000          0
# 3      38        0        0          2             4          0       29 0.7692308          0
# n_periods n_urls n_words n_caps n_nonasciis n_puncts    n_capsp n_charsperword
# 1         0      1       5      2           0        0 0.13636364       3.666667
# 2         0      0       1      0           0        0 0.25000000       2.000000
# 3         0      0      10      2           0        5 0.07692308       3.545455