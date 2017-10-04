require 'json'

module ApiWrapperSkeleton
  class Resource
    def initialize(connection)
      @connection = connection
      @base_url = "#{connection.url_prefix}"
    end

    def self.endpoint(action, config)
      define_method(action) do |params|
        send(config[:method], config[:path], params)
      end
    end

    def post(action, params)
      @connection.post do |request|
        request.url build_url(action.dup, params)
        request.body = params.to_json
      end
    end

    def get(action, params)
      @connection.get do |request|
        request.url build_url(action.dup, params)
      end
    end

    def put(action, params)
      @connection.put do |request|
        request.url build_url(action.dup, params)
        request.body = params.to_json
      end
    end

    def delete(action, params)
      @connection.delete do |request|
        request.url build_url(action.dup, params)
      end
    end

    private

    def build_url(action, params)
      action.tap do |a|
        params.each do |k, v|
          a.gsub!(/:#{k}/, v.to_s) if a.match(/:#{k}/)
        end
      end

      "#{@base_url}#{action}"
    end
  end
end
