require 'ostruct'

# Public: Talks offered the previous week at the conf.
class Confs::Talk
  include Comparable

  def id
    slug
  end

  # Initializes an Talk.
  #
  # resource - An Hyperclient::Resource representing an Talk.
  def initialize(resource)
    @attributes = OpenStruct.new(resource.attributes.to_hash)
  end

  # Internal: Redirects all methods to the OpenStruct that has all the
  # attributes.
  def method_missing(method, *args, &block)
    @attributes.send(method, *args, &block)
  end

  # Internal: A method so jobs can be sorted alphabetically (using the
  # name)
  def <=>(other)
    self.date <=> other.date
  end

  # Internal: Compares two jobs by their id.
  def ==(other)
    self.id == other.id
  end
end
