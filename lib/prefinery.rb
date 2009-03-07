require 'rubygems'

module Prefinery

  class << self
    attr_accessor :subdomain, :host, :port, :secure, :beta

    def subdomain
      @subdomain
    end
    
    def port
      @port || (secure ? 443 : 80)
    end

    def host
      @host ||= "#{subdomain}.prefinery.com"
    end
    
    def beta
      @beta
    end
    
    # Call this method to modify defaults in your initializers.
    #
    # Prefinery.configure do |config|
    #   config.subdomain = 'compulsivo'
    #   config.beta = '1'
    #   config.secure  = false
    # end
    def configure
      yield self
    end
    
    def protocol #:nodoc:
      secure ? "https" : "http"
    end
    
    def url #:nodoc:
      URI.parse("#{protocol}://#{host}:#{port}/betas/#{beta}")
    end
    
  end

end
