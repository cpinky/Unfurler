require 'web'

module SlackMathbot
  module PeerStreet
    class ContainsPrivateLink
      def self.contains_private_link?(event_hash)
        event_hash["event"]["links"][0]["url"].start_with? "https://athena.peerstreet.com"
      end
    end
  end
end
