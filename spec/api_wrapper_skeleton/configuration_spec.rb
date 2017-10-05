require 'spec_helper'

RSpec.describe ApiWrapperSkeleton::Configuration do
  let(:configuration) { ApiWrapperSkeleton::Configuration.new }

  describe 'default values' do
    it 'sets the correct API Key' do
      expect(configuration.api_key).to be_nil
    end

    it 'sets the correct API Secret' do
      expect(configuration.api_secret).to be_nil
    end

    it 'sets the correct API URL' do
      url = 'https://domain-of-my-super-cool-api.com/api/you-versioned-this-right'
      expect(configuration.api_url).to eq url
    end
  end
end
