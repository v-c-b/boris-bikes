class Docking_Station
  attr_accessor :store
  def initialize
    @store = store
    # @store = []
  end
  def release_bike
    if @store == nil then
      fail
    else
      t = @store
      @store = nil
      t
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
    if station.store == nil then
      station.store = self
    else fail
    end
  end

end
