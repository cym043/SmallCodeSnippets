#Import Request, BeautifulSoup, re(Regex)
from bs4 import BeautifulSoup
import requests
import re


#Get HTML Data
user = "cym043"
r = requests.get("https://github.com/" + user)

#Check if request was valid, if so write to a variable
if r.status_code == 200:
    html = r.text
else:
    print("Error with getting the HTML data")

#Regex: find all values that start with an <img until src=" and end with an ". Also return the value between these.
result = re.findall('<img[^>]+src="([^">]+)"', html)
print(result)

#BeautifulSoup: use the build in "find_all" function to get all tags that start with an img
scrape = BeautifulSoup(html, 'html.parser')
print(scrape.find_all("img"))
