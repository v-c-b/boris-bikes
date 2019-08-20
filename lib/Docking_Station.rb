
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
    if empty? then
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
  # attr_accessor :location
  # def initialize(location)
  #    @location = location
  # end
  def working?
    return true
  end
  def docking(station)
    if station.store.length < $LIMIT then
      station.store << self
    else fail
    end
  end

end
