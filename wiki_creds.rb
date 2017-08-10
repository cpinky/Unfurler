require 'rubygems'
require 'confluence/api/client'

username = 'cpinkerton@peerstreet.com'
password = 'Ekg0AixtdNZijQARYROPYouzlN0uxu2aqFYjzWVb'
space    = 'General'
url      = 'https://peerstreet.atlassian.net/wiki'


client = Confluence::Api::Client.new(username, password, url)
page = client.get({spaceKey: space, title: 'September'})[0]
client.create({type:"page",title: "title", space: {key: space}, ancestors:[{type:"page",id: page['id']}]})
