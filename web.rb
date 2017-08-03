require 'sinatra/base'
require 'sinatra/reloader'
require 'slack-mark5/peer_street/contains_private_link'
require 'slack-mark5/peer_street/post_message'

module SlackMathbot
  class Web < Sinatra::Base
    configure :development do
      register Sinatra::Reloader
    end #configure
    post '/slack/events' do
      payload = JSON.parse request.body.read #Sets the json body equal to the variable payload

      if payload['challenge'] #Checks if there is a verification and responds with the challenge
        payload['challenge']
      elsif PeerStreet::ContainsPrivateLink.contains_private_link? payload #checks if the link is from athena.peerstreet
        PeerStreet::PostMessage.post_messsage payload #prints message into SLACK as user
      end #if
    end #post
  end #class
end #method
