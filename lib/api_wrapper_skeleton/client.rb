require 'faraday'

module ApiWrapperSkeleton
  class Client
    def initialize
      generate_resource_methods
    end

    def connection
      @connection ||= Faraday.new(connection_options) do |req|
        req.adapter :net_http
      end
    end

    private

    def generate_resource_methods
      ApiWrapperSkeleton::ResourceCollection.resource_names.each do |name|
        define_singleton_method(name) do
          klass_name = ApiWrapperSkeleton::Helpers.camelize_string(name)
          klass = Object.const_get "ApiWrapperSkeleton::ResourceCollection::#{klass_name}"

          klass.new(connection)
        end
      end
    end

    def api_url
      @api_url ||= ApiWrapperSkeleton.configuration.api_url
    end

    def connection_options
      {
        url: api_url,
        headers: {}
      }
    end
  end
end
