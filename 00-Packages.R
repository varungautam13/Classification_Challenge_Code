library(readxl)
library(tm)
library(dplyr)
library(caret)
library(twitteR)
library(base64enc)

## Twitter
api_key <- "fRCKlfukD5GhYgCtJnOFwwJRd"
api_secret <- "mavuMFoquelo5SMNBVo2PnnHAi4m2MaOm7LChiaoXfbY9xLrbp"
token <- "3134164560-tYAACVlvlMh8tzqBAbNdfLD12fumHAsf278l8t7"
token_secret <- "Nt9GaL5BCsSeRPX7A48y3WZnpRLfXjDrXadQmECHbD3qX"

setup_twitter_oauth( api_key, api_secret,token, token_secret)

