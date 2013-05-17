require 'spec_helper'

describe 'Foundation Center' do

  context 'Listing grant recipients' do
    before(:each) do
      # Fake the response json
      @fake_json = fake_recipients_json

      FoundationCenter::Client.should_receive(:get_recipients) { JSON.parse @fake_json }
    end

    it 'returns an array' do
      FoundationCenter.recipients.should be_kind_of(Array)
    end

    it 'returns a hash for every grant recipient' do
      # Parse the fake JSON so we can count the recipients
      fakes = JSON.parse @fake_json
      fakes.should be_kind_of(Array)

      # One for every recipient
      recipients = FoundationCenter.recipients
      recipients.length.should == fakes.length

      # All of which are hashes
      recipients.each do |r|
        r.should be_kind_of(Hash)
      end
    end
  end

  context 'Recipient details' do
    it 'returns details about a grant recipient'
    it 'returns details about the grants a recipient has received'
  end
end