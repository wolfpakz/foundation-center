require 'foundation_center/client'
require 'foundation_center/version'

module FoundationCenter
  def self.recipients
    Client.get_recipients
  end
end
