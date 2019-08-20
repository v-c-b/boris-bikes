
class Docking_Station
$DEFAULT_CAPACITY = 20
  attr_accessor :store
  def initialize(cap = $DEFAULT_CAPACITY)
    @store = store
    @store = []
    @cap = cap
    $LIMIT = cap
  end
  def release_bike
    if empty? or @store[1].functional == false then #this is fudged - assumes only one bike is stored
      fail
    else
      t = @store
      @store = []
      t
    end
  end
private
def empty?
  if @store == [] then
    return true
  else false
  end
end


end


class Bike
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
