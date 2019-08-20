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

describe "exceeding capacity" do
  it "raises" do
    t = Docking_Station.new
    b = Bike.new
    c = Bike.new
    b.docking(t)
    expect {c.docking(t)}.to raise_error
  end
end



describe Bike do
 it { is_expected.to respond_to(:working?) }
 it { is_expected.to respond_to(:docking) }
 it {is_expected.to respond_to(:docking).with(1).argument }

end
