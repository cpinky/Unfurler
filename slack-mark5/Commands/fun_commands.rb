module PeerStreetBot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base #Fun Stuff
      match /^Who are you/ do |client, data, match|
        client.say(channel: data.channel, text: "I am Jarvis, Nice to Meet you.")
      end
    end
    class Underoos < SlackRubyBot::Commands::Base
      match /^Underoos/ do |client, data, match|
        client.say(channel: data.channel, text: "Hey Everyone. https://media.giphy.com/media/3o7abooVPgeGpknXpu/giphy.gif")
      end
    end
    class Oops < SlackRubyBot::Commands::Base
      match /^oops/ do |client, data, match|
        client.say(channel: data.channel, text: "oops. http://i.imgur.com/G3pTScy.gif")
      end
    end
    class Hello < SlackRubyBot::Commands::Base
      match /^hello/ do |client, data, match|
        client.say(channel: data.channel, text: "Hello. https://media.tenor.com/images/c706798de97df582f20a164f60d21761/tenor.gif")
      end
    end
    class Hello2 < SlackRubyBot::Commands::Base
      match /^Hello/ do |client, data, match|
        client.say(channel: data.channel, text: "Hello. https://media.tenor.com/images/c706798de97df582f20a164f60d21761/tenor.gif")
      end
    end
  end
end
