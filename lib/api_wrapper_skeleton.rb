require 'api_wrapper_skeleton/version'
require 'api_wrapper_skeleton/resources'
require 'api_wrapper_skeleton/helpers'

module ApiWrapperSkeleton
  autoload :Client, 'api_wrapper_skeleton/client'
  autoload :Resource, 'api_wrapper_skeleton/resource'

  include Resources
  include Helpers
end
