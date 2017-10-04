module ApiWrapperSkeleton
  module Helpers
    class << self
      # From Rails Inflection Method #camelize
      # https://github.com/rails/rails/blob/master/activesupport/lib/active_support/inflector/methods.rb

      def camelize(string, uppercase_first_letter = true)
        if uppercase_first_letter
          string = string.sub(/^[a-z\d]*/) { $&.capitalize }
        else
          string = string.sub(/^(?:(?=\b|[A-Z_])|\w)/) { $&.downcase }
        end

        string.gsub(/(?:_|(\/))([a-z\d]*)/) { "#{$1}#{$2.capitalize}" }.gsub('/', '::')
      end
    end
  end
end
