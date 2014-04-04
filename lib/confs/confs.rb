require 'hyperclient'

module Confs
  # Public: Loads needed configuration to connect to the service.
  def self.config
    @config ||= Config.new
  end

  # Represents an Hypermedia client using Hyperclient from @oriolgual
  class Client
    # Public: Creates a new Hyperclient to retrieve data from the service.
    #
    # Returns an Hyperclient.
    def self.build
      Hyperclient.new(Confs.config.api_url).tap do |api|
        api.digest_auth(
          Confs.config.conference_name,
          Confs.config.conference_token
        )
      end
    end

    def speakers
      collection_for(:speaker)
    end

    def sponsors
      collection_for(:sponsor)
    end

    def posts
      collection_for(:post)
    end

    def job_offers
      collection_for(:job_offer)
    end

    def events
      collection_for(:event)
    end

    def talks
      collection_for(:talk)
    end

    def workshops
      collection_for(:workshop)
    end

    private
    def collection_for(resource)
      Confs::Collection.new({resource_name: resource}).collection
    end
  end

  # This class sets up connection paramaters.
  class Config
    attr_accessor :api_url,
                    :conference_name,
                    :conference_token

    # The "api_url" used to connect with Confly service.
    #
    # @return [String]
    #    The api service url.
    #
    def api_url
      @api_url || ENV.fetch( 'CONFLY_API_URL', 'http://conferences.codegram.com/api/endpoint' )
    end

    # The "conference_name" used for digest authentication.
    #
    # @return [String]
    #    The conference name.
    #
    def conference_name
      @conference_name ||= ENV.fetch('CONFLY_API_CONFERENCE')
    end

    # The "conference_token" used for digest authentication
    #
    # @return [String]
    #    The conference token.
    #
    def conference_token
      @conference_token || ENV.fetch( 'CONFLY_API_TOKEN')
    end
  end
end
