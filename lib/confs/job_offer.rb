require 'ostruct'

# Public: Jobs are offered by the sponsors in the conference.
class Confs::JobOffer
  include Comparable

  attr_reader :sponsor

  def id
    slug
  end

  # Initializes a Job.
  #
  # resource - An Hyperclient::Resource representing a Job.
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
    self.name <=> other.name
  end

  # Internal: Compares two jobs by their id.
  def ==(other)
    self.id == other.id
  end
end
