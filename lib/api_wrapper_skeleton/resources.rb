module ApiWrapperSkeleton
  module Resources
    RUBY_FILENAME_REGEX = /(\w*)(\.rb)/

    class << self
      def included(base)
        resource_names.each do |resource_name|
          module_name = ApiWrapperSkeleton::Helpers.camelize(resource_name)

          autoload :"#{module_name}", "#{directory}/#{resource_name}"
        end
      end

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
