require 'rubygems'
require 'confluence/api/client'

username = 'email'
password = 'pass'
space    = 'General'
url      = 'wiki'


client = Confluence::Api::Client.new(username, password, url)
page = client.get({spaceKey: space, title: 'September'})[0]
client.create({type:"page",title: "title", space: {key: space}, ancestors:[{type:"page",id: page['id']}]})
