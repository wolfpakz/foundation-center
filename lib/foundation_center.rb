require 'foundation_center/version'

module FoundationCenter

  URL = 'http://gisdev.foundationcenter.org/sustainArts/webServices'

  class << self

    def get_recipients
      response = resource['getRecipients.php'].get
      JSON.parse response
    end

    def get_recipient_details(ein)
      response = resource['getRecipientDetails.php'].get :params => {:ein => ein}
      JSON.parse response
    end

    def resource
      RestClient::Resource.new(URL)
    end

  end
end
