require 'spec_helper'

RSpec.describe ApiWrapperSkeleton::Client do
  let(:resources) { [:cool_things, :users] }
  let(:client) { ApiWrapperSkeleton::Client.new }

  it 'creates methods for each resource' do
    methods = client.methods - Object.methods

    resources.each do |resource|
      expect(client.methods).to include resource
    end
  end

  describe '.connection' do
    it 'returns a Faraday connection' do
      expect(client.connection.class).to eq Faraday::Connection
    end
  end
end
