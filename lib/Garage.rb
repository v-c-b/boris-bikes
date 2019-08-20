class Garage
$DEFAULT_CAPACITY_GARAGE = 30
attr_accessor :store

def initialize(cap = $DEFAULT_CAPACITY_GARAGE)
  @store = store
  @store = []
  @cap = cap
  $LIMIT = cap
end

def collect(bike)
  @store << bike
  bike.functional = true
end




end
