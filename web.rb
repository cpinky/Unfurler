require 'sinatra/base'
require 'sinatra/reloader'

module SlackMathbot
  class Web < Sinatra::Base
    configure :development do
      register Sinatra::Reloader
    end

    get '/' do
      #'Math is good for you.'

    end

    get '/slack/events' do
      puts params
    end

    post '/slack/events' do
      json = JSON.parse(request.body.read)

      hash = json
      puts "EVENT: #{json.to_s}"
      if json['challenge']
        challenge = json['challenge']
        puts "replying with #{challenge}"
        challenge
      elsif  hash["event"]["links"][0]["domain"] == "athena.peerstreet"
        puts "jarvis you are a genius"
      else
        puts "processing"
      end
    end
  end
end
