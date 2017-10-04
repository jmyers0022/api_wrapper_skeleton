module ApiWrapperSkeleton
  class Configuration
    attr_accessor :api_key, :api_secret
    attr_reader :api_url

    def initialize
      @api_key = nil
      @api_secret = nil
      @api_url = 'https://domain-of-my-super-cool-api.com/api/you-versioned-this-right'
    end
  end
end
