require 'foundation_center/client'
require 'foundation_center/version'

module FoundationCenter
  def recipients
    Client.get_recipients
  end
end
