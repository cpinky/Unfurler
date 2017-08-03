require 'sinatra/base'
require 'sinatra/reloader'
require 'slack-mark5/peer_street/contains_private_link'
require 'slack-mark5/peer_street/post_message'

module SlackMathbot
  class Web < Sinatra::Base
    configure :development do
      register Sinatra::Reloader
    end #configure

    get '/' do; end #Needed for verification

    get '/slack/events' do
      puts params
    end #get

    post '/slack/events' do
      payload = JSON.parse(request.body.read) #Sets the json boy equal to the variable payload

      puts "EVENT: #{params.to_s}"   #Prints the Event in Terminal and allows search through it
      if payload['challenge'] #Checks if there is a verification and responds with the challenge
        challenge = payload['challenge']
        puts "replying with #{challenge}"
        challenge
      elsif PeerStreet::ContainsPrivateLink.contains_private_link? payload #checks if the link is from athena.peerstreet
        PeerStreet::PostMessage.post_messsage payload #prints message into SLACK as user
      else
        puts "processing"
      end #if
    end #post
  end #class
end #method
