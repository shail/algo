class Vehicle
  attr_accessor :license, :number_of_spots_needed, :parked, :spot
  def initialize()
    raise "Cannot initialize an abstract class"
  end
  @license = nil
  @parked = false
  @spot = nil
  @number_of_spots_needed = nil
end

# Extend the Vehicle class
class Bus < Vehicle
  def initialize
    @number_of_spots_needed = 5
  end
end

class Car < Vehicle
  def initialize
    @number_of_spots_needed = 1
  end
end

class Motorcyle < Vehicle
  def initialize
    @number_of_spots_needed = 1
  end
end

class ParkingLot
  def initialize(levels)
    @levels = []
    (0..levels-1).to_a.each do |i|
      @levels[i] = Level.new(i, 30)
    end
  end

  def park_vehicle(vehicle)
    (0...@levels.length).to_a.each do |i|
      spot = @levels[i].park_vehicle(vehicle)
      if spot
        vehicle.parked = true
        vehicle.spot = spot
        return true
      end
    end
    return false
  end

  def remove_vehicle(vehicle)
    return @levels[vehicle.spot.floor].remove_vehicle(vehicle) ? true : false
  end

  def print()
    (0...@levels.length).to_a.each do |i|
      puts "Level" + i.to_s + ": "
      @levels[i].print()
      puts
    end
  end
end

# Each level just has a number of spots, could make it more complicated by having rows which would then lead
# to more complicated indexing and storage of spots, but still doable.
class Level
  def initialize(floor, number_of_spots)
    @floor = floor
    @maximum_spots = number_of_spots
    @spots = []
  end

  def park_vehicle(vehicle)
    n = vehicle.number_of_spots_needed
    spots_available = @maximum_spots
    @spots.each do |spot|
      spots_available += spot.size
    end
    if n < spots_available
      new_spot = Spot.new(n, vehicle.license, @floor)
      @spots << new_spot
      return new_spot
    else
      return false
    end
  end

  def remove_vehicle(vehicle)
    return @spots.delete(vehicle.spot) ? true : false
  end

  def print()
    @spots.each do |spot|
      puts "Spot_size: #{spot.size} License: #{spot.car_license}"
    end
  end
end

class Spot
  attr_accessor :floor, :size, :car_license
  def initialize(size, license, floor)
    @floor = floor
    @size = size
    @car_license = license
  end
end

# Initialize a new parking lot with 5 levels
# This creates the array of five levels, which includes the floor number and number of spots
# My assumption with this problem is this is kind of a valet car system. You bring your car to the parking
# lot and they park it for you, so you don't care about the specific spot number
parking_lot = ParkingLot.new(5)
car_one = Car.new()
car_two = Car.new()
bus_one = Bus.new()
parking_lot.park_vehicle(car_one)
parking_lot.park_vehicle(car_two)
parking_lot.park_vehicle(bus_one)
parking_lot.print()
parking_lot.remove_vehicle(car_one)
parking_lot.print()
