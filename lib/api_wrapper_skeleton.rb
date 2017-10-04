require 'api_wrapper_skeleton/version'
require 'api_wrapper_skeleton/helpers'

module ApiWrapperSkeleton
  autoload :Client, 'api_wrapper_skeleton/client'
  autoload :Resource, 'api_wrapper_skeleton/resource'

  module Resources
    autoload :Users, 'api_wrapper_skeleton/resources/users'
    autoload :CoolThings, 'api_wrapper_skeleton/resources/cool_things'

    RUBY_FILENAME_REGEX = /(\w*)(\.rb)/

    class << self
      def resource_names
        resource_filenames.map do |filename|
          next unless filename.end_with? 'rb'
          filename.match(RUBY_FILENAME_REGEX)
        end.compact.map{ |match| match[1] }
      end

      protected

      def directory
        File.expand_path(
          File.join('lib', 'api_wrapper_skeleton', 'resources')
        )
      end

      def resource_filenames
        Dir.entries(directory)
      end
    end
  end
end
