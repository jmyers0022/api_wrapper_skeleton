module ApiWrapperSkeleton
  module ResourceCollection
    RUBY_FILENAME_REGEX = /(\w*)(\.rb)/

    class << self
      def resource_names
        resource_filenames.map do |filename|
          next unless filename.end_with? 'rb'

          filename.match(RUBY_FILENAME_REGEX)
        end.compact.map{ |match| match[1] }
      end

      def directory
        File.expand_path(
          File.join('lib', 'api_wrapper_skeleton', 'resources')
        )
      end

      protected

      def resource_filenames
        Dir.entries(directory)
      end
    end
  end
end
