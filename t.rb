require 'oauth'
require 'json'

consumer_key = 'Sorq2fWtuL-FF7AYS0dq-w'
consumer_secret = 'HTWRIJmFgHStxEqz0ItWqaPGIHE'
token = '_PDNffZN54vOmnzYtzp7ig98gyX3zg0L'
token_secret = 'RgEjVR7ECQS5mxmD1l4lTC2ifIA'

api_host = 'api.yelp.com'

consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
access_token = OAuth::AccessToken.new(consumer, token, token_secret)

path = "/v2/search?term=restaurants&location=new%20brunswick"

#p access_token.get(path).body.class

json = JSON.parse access_token.get(path).body
puts (json)

