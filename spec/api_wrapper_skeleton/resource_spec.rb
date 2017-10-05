require 'spec_helper'

RSpec.describe ApiWrapperSkeleton::Resource do
  let(:resource) { :cool_things }
  let(:client) { ApiWrapperSkeleton::Client.new }

  describe 'self.endpoint' do
    let(:path) { '/things' }
    let(:action) { :my_method }
    let(:method) { :get }

    before do
      ApiWrapperSkeleton::Resource.endpoint(
        action,
        http_method: method,
        path: path
      )
    end

    it 'defines a method' do
      endpoint_methods = client.send(resource).methods - Object.methods

      expect(endpoint_methods).to include action
    end
  end
end
