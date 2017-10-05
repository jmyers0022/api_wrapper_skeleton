require 'api_wrapper_skeleton/version'
require 'api_wrapper_skeleton/configuration'
require 'api_wrapper_skeleton/helpers'

require 'api_wrapper_skeleton/resource_collection'
require 'api_wrapper_skeleton/resource'
require 'api_wrapper_skeleton/client'

Dir[
  "#{ApiWrapperSkeleton::ResourceCollection.directory}/**/*.rb"
].each { |f| require f }

module ApiWrapperSkeleton
  include Helpers

  class << self
    attr_accessor :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
