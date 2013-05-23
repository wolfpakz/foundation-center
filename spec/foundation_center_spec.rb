require 'spec_helper'

describe 'Foundation Center' do

  context 'Listing grant recipients' do
    before(:each) do
      # Fake the response json
      @fake_json = fake_recipients_json

      RestClient::Resource.any_instance.should_receive(:get) { @fake_json }
    end

    it 'returns an array' do
      FoundationCenter.get_recipients.should be_kind_of(Array)
    end

    it 'returns a hash for every grant recipient' do
      # Parse the fake JSON so we can count the recipients
      fakes = JSON.parse @fake_json
      fakes.should be_kind_of(Array)

      # One for every recipient
      recipients = FoundationCenter.get_recipients
      recipients.length.should == fakes.length

      # All of which are hashes
      recipients.each do |r|
        r.should be_kind_of(Hash)
      end
    end
  end

  context 'Recipient details' do
    before(:each) do
      # Fake the response json
      @fake_json = fake_recipient_details_json

      @parsed_json = JSON.parse @fake_json
      @ein         = @parsed_json['recipients'].first['recip_ein']

      RestClient::Resource.any_instance.should_receive(:get) { @fake_json }
    end

    it 'returns a hash' do
      FoundationCenter.get_recipient_details(@ein).should be_kind_of(Hash)
    end

    it 'returns details about a grant recipient' do
      results = FoundationCenter.get_recipient_details(@ein)

      results.should include('recipients')
      results['recipients'].should be_an(Array)

      recipient = results['recipients'].first
      recipient.should be_a(Hash)
      recipient.should include('recip_ein')

      recipient['recip_ein'].should == @ein
    end

    it 'returns details about the grants a recipient has received' do
      results = FoundationCenter.get_recipient_details(@ein)

      results.should include('grants')
      results['grants'].should be_an(Array)

      grants = results['grants']
      grants.all? { |grant| grant.is_a?(Hash) }.should be_true
    end
  end
end