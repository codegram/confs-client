require 'ostruct'

# Public: Speakers are the main product of the conference.
class Confs::Speaker
  include Comparable

  # Initializes a Speaker.
  #
  # resource - An Hyperclient::Resource representing a Speaker.
  def initialize(resource)
    @attributes = OpenStruct.new(resource.attributes.to_hash)
  end

  # Internal: Redirects all methods to the OpenStruct that has all the
  # attributes.
  def method_missing(method, *args, &block)
    @attributes.send(method, *args, &block)
  end

  # Internal: A method so speakers can be sorted alphabetically (using the
  # name)
  def <=>(other)
    self.name <=> other.name
  end

  # Internal: Compares two speakers by their id.
  def ==(other)
    self.id == other.id
  end
end
