module ApiWrapperSkeleton
  module ResourceCollection
    RUBY_EXTENSION_REGEX = /.rb/
    RUBY_FILENAME_REGEX = /(\w*)(\.rb)/

    class << self
      def resource_names
        resource_filenames.grep(RUBY_EXTENSION_REGEX).map do |f|
          f.match(RUBY_FILENAME_REGEX)[1]
        end
      end

      def directory
        File.expand_path(
          File.join('lib', 'api_wrapper_skeleton', 'resources')
        )
      end

      def namespaced_class_for(klass_name)
        Object.const_get "#{self.name}::#{klass_name}"
      end

      protected

      def resource_filenames
        Dir.entries(directory)
      end
    end
  end
end
