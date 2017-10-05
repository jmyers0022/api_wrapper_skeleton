require 'json'

module ApiWrapperSkeleton
  class Resource
    def initialize(connection)
      @connection = connection
      @base_url = "#{connection.url_prefix}"
    end

    def self.endpoint(action, http_method:, path:)
      define_method(action) do |params|
        send(http_method, path, params)
      end
    end

    private

    def post(path, params)
      @connection.post do |request|
        request.url build_url(path.dup, params)
        request.body = params.to_json
      end
    end

    def get(path, params)
      @connection.get do |request|
        request.url build_url(path.dup, params)
      end
    end

    def put(path, params)
      @connection.put do |request|
        request.url build_url(path.dup, params)
        request.body = params.to_json
      end
    end

    def delete(path, params)
      @connection.delete do |request|
        request.url build_url(path.dup, params)
      end
    end

    def build_url(path, params)
      path.tap do |path_string|
        params.each do |k, v|
          path_string.gsub!(/:#{k}/, v.to_s) if path_string.match(/:#{k}/)
        end
      end

      "#{@base_url}#{path}"
    end
  end
end
