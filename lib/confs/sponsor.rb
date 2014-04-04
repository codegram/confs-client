module Confs
  class Sponsor
    include Comparable
    
    def initialize(resource)
      @attributes = OpenStruct.new(resource.attributes.to_hash)
    end

    # Public: The date in which this sponsor slot was reserved. Used to check
    # when a reservation expires and the order of the sponsors in the list.
    def slot_reserved_at
      @slot_reserved_at ||= Date.parse(attributes.slot_reserved_at)
    end

    def <=>(other)
      self.slot_reserved_at <=> other.slot_reserved_at
    end

    def ==(other)
      self.id == other.id
    end

    def published?
      state == 'published'
    end

    def website_tracker
      "#{@attributes.website.to_s}?utm_source=baruco&utm_medium=banner&utm_campaign=#{category_name.downcase}_sponsorship"
    end

    # Internal: Redirects all methods to the OpenStruct that has all the
    # attributes.
    def method_missing(method, *args, &block)
      @attributes.send(method, *args, &block)
    end
  end
end
