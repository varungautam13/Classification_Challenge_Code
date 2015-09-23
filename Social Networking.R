## Twitter
api_key <- "fRCKlfukD5GhYgCtJnOFwwJRd"
api_secret <- "mavuMFoquelo5SMNBVo2PnnHAi4m2MaOm7LChiaoXfbY9xLrbp"
token <- "3134164560-tYAACVlvlMh8tzqBAbNdfLD12fumHAsf278l8t7"
token_secret <- "Nt9GaL5BCsSeRPX7A48y3WZnpRLfXjDrXadQmECHbD3qX"

setup_twitter_oauth( api_key, api_secret,token, token_secret)

## Facebook
library(Rfacebook)
fb_oauth <- fbOAuth(app_id="1500178326946296", app_secret="f079c3c50e6c5691173a0012b86d4c6e",extended_permissions = TRUE)
getUsers("Varun Gautam", fb_oauth)
getFriends(fb_oauth,simplify = T)

## Linkedin
library(Rlinkedin)
in.auth <- inOAuth("Varun", "75wy1hjpdz0xr7", "gX3k9fQVrKRk8MVM")

my.connections <- getMyConnections(in.auth)
getProfile(in.auth)
