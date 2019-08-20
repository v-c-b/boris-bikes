class Van
  $DEFAULT_CAPACITY_VAN = 5
  attr_accessor :store
  def initialize(cap = $DEFAULT_CAPACITY)
    @store = store
    @store = []
    @cap = cap
  end

  def collect(location)
    if location.instance_of? Docking_Station then
      pick_bikes_state = false
    else pick_bikes_state = true
    end
    location.store.each do |x|
      if x.functional == pick_bikes_state and @store.length < $DEFAULT_CAPACITY_VAN then
        @store << x
      end
    end
  end

def docking(location)
  @store.each do |x|
    if location.store.length < $DEFAULT_CAPACITY_GARAGE then
      location.collect(x)
    else fail
    end
  end
  @store = []
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
