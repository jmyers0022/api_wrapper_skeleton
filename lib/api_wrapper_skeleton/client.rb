require 'faraday'

module ApiWrapperSkeleton
  class Client
    def initialize(access_token:, api_url: nil)
      @access_token = access_token
      @api_url = api_url

      generate_resource_methods
    end

    def connection
      @connection ||= Faraday.new(connection_options) do |req|
        req.adapter :net_http
      end
    end

    def generate_resource_methods
      ApiWrapperSkeleton::Resources.resource_names.each do |name|
        define_singleton_method(name) do
          klass = Object.const_get "ApiWrapperSkeleton::Resources::#{name.camelize}"

          klass.new(connection)
        end
      end
    end

    private

    def api_url
      @api_url ||= ENV['MY_API_URL']
    end

    def connection_options
      {
        url: api_url,
        headers: {
          content_type: 'application/json',
          authorization: "Token token=#{@access_token}"
        }
      }
    end
  end
end
