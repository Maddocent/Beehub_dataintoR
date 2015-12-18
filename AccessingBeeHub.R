#Author: Marc Teunis, date: 18 december 2015

#Reading data files from Beehub into R
# data files (*.csv / *.txt / *.xls(x) are stored in 
#https://beehub.nl/Innovative_Testing/)
# with functions read.table or read.csv i have tried to open the files from 
#this location into R.

#below are some snippets of code i've found

  library(RCurl)
x <- getURL("https://user:pass@my.webdav.server.net/webdav/data/data.csv")
y <- read.csv(text = x,stringsAsFactors=FALSE,na.strings = "NA")


#For this to work I need the webDAV details for BeeHub.

#the code below does not work but could be a valuable approach....????

library(httr)
html <- content(GET('https://jump.valueline.com/login.aspx'), "text")

viewstate <- as.character(sub('.*id="_VIEWSTATE" value="([0-9a-zA-Z+/=]*).*', '\\1', html))

params <- list(
  'ct100$ContentPlaceHolder$LoginControl$txtUserID' = 'MY USERNAME',
  'ct100$ContentPlaceHolder$LoginControl$txtUserPw' = 'MY PASSWORD',
  'ct100$ContentPlaceHolder$LoginControl$btnLogin' = 'Sign In',
  '_VIEWSTATE' = viewstate
)
POST('https://jump.valueline.com/login.aspx', body = params)


