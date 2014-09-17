
module BikeContainer

  DEFAULT_CAPACITY = 10

  def bikes 
  	@bikes ||= []
  end

  def capacity
  	@capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)
  	@capacity = value
  end

  def bike_count
    bikes.count
  end

  def dock(bike)
  	raise "Station is full" if full?
    raise "This is not a bike" if bike.class != Bike
  	bikes << bike
  end
 
  def release
    raise "The holder is empty!" if available_bikes.empty?
    bikes.delete(available_bikes.pop)
  end

  def full?
    bike_count == capacity
  end

  def available_bikes
  	bikes.reject {|bike| bike.broken? }
  end
end