
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

  def collect(bike)
    @store << bike
  end

  def storage
    return @store
  end



private
def empty?
  if @store == [] then
    return true
  else false
  end
end


end
