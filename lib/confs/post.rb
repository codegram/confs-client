module Confs
  class Post
    include Comparable

    attr_reader :attributes

    def initialize(resource)
      @attributes = OpenStruct.new(resource.attributes.to_hash)
    end

    def id
      slug
    end

    def updated_at
      published_at
    end

    def to_param
      id
    end

    def published_at
      @published_at ||= Date.parse(attributes.published_at)
    end

    def <=>(other)
      self.published_at <=> other.published_at
    end

    def ==(other)
      self.id == other.id
    end

    def published?
      state == 'published'
    end

    # Internal: Redirects all methods to the OpenStruct that has all the
    # attributes.
    def method_missing(method, *args, &block)
      @attributes.send(method, *args, &block)
    end
  end
end
