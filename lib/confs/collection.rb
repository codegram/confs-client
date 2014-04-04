module Confs
  # Represents a Confly resource collection.
  class Collection
    include Enumerable
    extend Forwardable

    attr_reader :resource_name, :link_name
    def_delegators :collection, :last

    def initialize(args = {})
      @resource_name = args.fetch(:resource_name).to_s
      @link_name = args.fetch(:link_name, pluralize(@resource_name))
    end

    def each(&block)
      collection.each(&block)
    end

    def [](index)
      collection[index]
    end

    def response
      @response ||= client.links[link_name]
    end

    def collection
      @collection ||= response.embedded[link_name].map do |resource|
        resource_class.new(resource)
      end
    end

    def resource_class
      begin
        get_class(resource_name)
      rescue NameError
        Confs::Resource
      end
    end

    private

    def get_class(string)
      string = camelize(string)
      constantize(string)
    end

    def camelize(string)
      strings = string.split('_')
      capitalized_strings = []
      strings.each do |string|
        capitalized_strings << string.capitalize
      end
      capitalized_strings.join
    end

    def constantize(string)
      Object.const_get("Confs::#{string}")
    end

    def pluralize(string)
      "#{string}s"
    end

    def client
      @client ||= Confs::Client.build
    end
  end
end
