require "Module.rb"

class Bike
  include Mix_in
  attr_accessor :functional

  def initialize
    functional = true
    @functional = functional
  end
  def working?
    return @functional
  end

  def docking(station)
    if station.store.length < $LIMIT then
      station.store << self
    else fail
    end
  end

  def report_broken
    @functional = false
  end

end
