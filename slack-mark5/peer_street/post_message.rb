require 'web'

module SlackMathbot
  module PeerStreet
    class PostMessage
      def self.post_messsage(event_hash)
        require 'rubygems'
        require 'confluence/api/client'

        username = '...'
        password = '...'
        space    = '...'
        url      = '...'

        id = /https:\/\/domain.atlassian.net\/wiki\/spaces\/.*\/pages\/(\d+)\/.*/.match(event_hash["event"]["links"][0]["url"])[1]


        wiki = Confluence::Api::Client.new(username, password, url)
        response = wiki.conn.get "/wiki/rest/api/content/#{id}?expand=body.storage"
        body = JSON.parse response.body


        client = Slack::Web::Client.new
        client.chat_postMessage(channel: event_hash["event"]["channel"], text: 'Get unfurled', as_user: true, "attachments": [
        {
          "fallback": "Required plain-text summary of the attachment.",
          "color": "#66CC33",
          "author_name": "Wiki",
          "author_link": "https://www.domain.com/",
          "author_icon": "https://cwiki.apache.org/confluence/images/logo/default-space-logo-256.png",
          "title": body["title"],
          "text": body[""],
        }
    ]
)

      end
    end
  end
end
