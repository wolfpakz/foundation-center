require 'foundation_center/version'

module FoundationCenter

  URL = 'http://gisdev.foundationcenter.org/sustainArts/webServices'

  class << self

    def get_recipients(param_hash = {})
      response = param_hash.has_key?(:state) ? (resource['getRecipients.php'].get :params => {:state => param_hash[:state]}) : (resource['getRecipients.php'].get)
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
