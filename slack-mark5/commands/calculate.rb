module SlackMathbot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      match /^Hello/ do |client, data, match|
        client.say(channel: data.channel, text: "I am Jarvis, Nice to Meet you.")
      end
    end
  end
end
