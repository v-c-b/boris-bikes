require "Docking_Station.rb"
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
