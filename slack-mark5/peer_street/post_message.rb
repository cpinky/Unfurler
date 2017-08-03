require 'web'

module SlackMathbot
  module PeerStreet
    class PostMessage
      def self.post_messsage(event_hash)
        client = Slack::Web::Client.new
        client.chat_postMessage(channel: event_hash["event"]["channel"], text: 'She is the Goddess of Wisdom', as_user: true, "attachments": [
        {
          "fallback": "Required plain-text summary of the attachment.",
          "color": "#36a64f",
          "pretext": "This is really cool, like me",
          "author_name": "Tony Stark",
          "author_link": "https://www.peerstreet.com/",
          "author_icon": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmsLHQ5E6duYJ-EQghTimUv7UxRufpsmqAjtjPaVH56kxJNkyGwM9ONg",
          "title": "I am Iron Man",
          "title_link": "https://api.slack.com/",
          "text": "Saving everyone with my two iron hands",
          "fields": [
              {
                  "title": "Who is the best avenger",
                  "value": "Me",
                  "short": false
              }
          ],
          "image_url": "https://cdn1.iconfinder.com/data/icons/UltraBuuf/128/Ironman_Hand.png",
          "thumb_url": "http://example.com/path/to/thumb.png",
          "footer": "Avengers",
          "footer_icon": "http://files.softicons.com/download/tv-movie-icons/iron-man-icon-set-by-svengraph/ico/Classic_Engine.ico",
          "ts": 123456789
        }
    ]
)

      end
    end
  end
end
