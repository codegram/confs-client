module Confs
  class Resource
    extend Forwardable
    attr_reader :resource
    def_delegators :resource, :attributes, :links

    # Public: Initializes the resource with the data it represents.
    #
    # resource - Hyperclient::Resource with all resource data.
    #
    # Returns nothing.
    def initialize(resource)
      @resource = resource
    end

    # Public: Current resource id at Confly service.
    #
    # Returns a String.
    def confly_id
      attributes['id']
    end

    # Public: Provides method access to the collection values.
    #
    # It allows accessing a value as `collection.name` instead of
    # `collection['name']`
    #
    # Returns an Object.
    def method_missing(method_name, *args, &block)
      attributes.send(method_name.to_s, *args, &block)
    end

    # Internal: Accessory method to allow the collection respond to the
    # methods that will hit method_missing.
    def respond_to_missing?(method_name, include_private = false)
      attributes.respond_to?(method_name.to_s)
    end
  end
end
