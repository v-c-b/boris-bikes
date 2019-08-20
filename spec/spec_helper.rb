require "Docking_Station.rb"
require "Bike.rb"
require "Van.rb"
require "Garage.rb"

describe Docking_Station do
 it { is_expected.to respond_to(:release_bike) }
 it { is_expected.to respond_to(:release_bike) }
end

describe "releasing bike" do
  it "raises" do
    expect {Docking_Station.release_bike}.to raise_error
  end
end


describe "holding capacity of 20" do
  it "raises" do
    t = Docking_Station.new
    c = Bike.new
    z = $DEFAULT_CAPACITY -1
    z.times {
      b = Bike.new
      b.docking(t)
    }
    expect {c.docking(t)}.not_to raise_error
  end
end

describe "exceeding capacity of 20" do
  it "raises" do
    t = Docking_Station.new
    c = Bike.new
    $DEFAULT_CAPACITY.times {
      b = Bike.new
      b.docking(t)
    }
    expect {c.docking(t)}.to raise_error
  end
end

describe "set capacity for a new docking station" do
  it "raises" do
    z = 10
    expect {Docking_Station.new(z)}.not_to raise_error
  end
end

describe Bike do
 it { is_expected.to respond_to(:working?) }
 it { is_expected.to respond_to(:docking) }
 it {is_expected.to respond_to(:docking).with(1).argument }
 it {is_expected.to respond_to(:report_broken)}
end

describe "report bike as broken" do
  it "raises" do
    c = Bike.new
    c.report_broken
    expect(c.functional).to be false
  end
end

describe "release broken bike" do
  it "raises" do
    t = Docking_Station.new
    c = Bike.new
    c.report_broken
    c.docking(t)
    expect {t.release_bike}.to raise_error
  end
end

describe "report bike as broken - isolated" do
  it "raises" do
    c = double(:functional => false) # setting c as a double which responds false to functional method
    expect(c.functional).to be false
  end
end

describe Van do
  it {is_expected.to respond_to(:collect)}
  it {is_expected.to respond_to(:collect).with(1).argument}
  it {is_expected.to respond_to(:docking)}
  it {is_expected.to respond_to(:docking).with(1).argument}
  it {is_expected.to respond_to(:storage)}

end

describe "pick up broken bikes" do
  it "raises" do
    station = Docking_Station.new
    bike = Bike.new
    bike.report_broken
    bike.docking(station)
    van = Van.new
    expect {van.collect(station)}.not_to raise_error
  end
end

describe "pick up and deliver broken bikes" do
  it "raises" do
    station = Docking_Station.new
    bike = Bike.new
    bike.report_broken
    bike.docking(station)
    van = Van.new
    van.collect(station)
    garage = Garage.new
    expect {van.docking(garage)}.not_to raise_error
  end
end

describe "pick up and deliver broken bikes + collect in good shape " do
  it "raises" do
    station = Docking_Station.new
    bike = Bike.new
    bike.report_broken
    bike.docking(station)
    van = Van.new
    van.collect(station)
    garage = Garage.new
    van.docking(garage)
    # expect {van.collect(garage)}.not_to raise_error
    van.collect(garage)
    expect(van.storage[0]).to eq(bike)
    expect(bike.functional).to be true
  end
end

describe "pick up and deliver broken bikes + collect in good shape and to station" do
  it "raises" do
    station = Docking_Station.new
    bike = Bike.new
    bike.report_broken
    bike.docking(station)
    van = Van.new
    van.collect(station)
    garage = Garage.new
    van.docking(garage)
    van.collect(garage)
    van.docking(station)
    expect(station.storage[0]).to eq(bike)
    expect(station.storage[1]).to eq(bike)
  end
end
