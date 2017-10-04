require 'api_wrapper_skeleton/version'
require 'api_wrapper_skeleton/configuration'
require 'api_wrapper_skeleton/resources'
require 'api_wrapper_skeleton/helpers'

module ApiWrapperSkeleton
  autoload :Client, 'api_wrapper_skeleton/client'
  autoload :Resource, 'api_wrapper_skeleton/resource'

  include Resources
  include Helpers

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
