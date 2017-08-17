require 'web'
require 'byebug'
require 'sanitize'

module SlackMathbot
  module PeerStreet
    class PostMessage
      def self.post_messsage(event_hash)
        require 'rubygems'
        require 'confluence/api/client'

        username = 'cpinkerton@peerstreet.com'
        space    = 'General'
        url      = 'https://peerstreet.atlassian.net/wiki'

        id = /https:\/\/peerstreet.atlassian.net\/wiki\/spaces\/.*\/pages\/(\d+)\/.*/.match(event_hash["event"]["links"][0]["url"])[1]


        wiki = Confluence::Api::Client.new(username, password, url)
        response = wiki.conn.get "/wiki/rest/api/content/#{id}?expand=body.storage"
        body = JSON.parse response.body

        client = Slack::Web::Client.new
        client.chat_postMessage(channel: event_hash["event"]["channel"], "attachments": [
          {
            "fallback": "Required plain-text summary of the attachment.",
            "color": "#66CC33",
            "author_name": "PeerStreet Wiki",
            "author_link": event_hash["event"]["links"][0]["url"],
            "author_icon": "https://peerstreet.atlassian.net/wiki/favicon.ico",
            "title": body["title"],
            #"text": /.*?<p>(.*?)<\/p>.*/.match(body["body"]["storage"]["value"])[1],
            "text": Sanitize.clean(body["body"]["storage"]["value"]),
          }
        ])
      end
    end
  end
end
