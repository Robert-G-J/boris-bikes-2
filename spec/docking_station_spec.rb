require './lib/docking_station'

describe DockingStation do

 describe "#dock2" do

  it 'docks a bike when passed dock(bike)' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it 'has an attribute set to an instance of Bike post docking' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq subject.bikes
  end

  it 'returns bike when asked for @bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to include bike
  end

  it 'raises an exception when a user tries to dock a bike at a full docking station' do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
    expect { subject.dock(Bike.new)}.to raise_error 'Error: this docking station is occupied.'
  end
end


describe "#capacity" do
  it {is_expected.to respond_to :capacity}

  it "can pass a value at initialisation" do
    expect { DockingStation.new(25) }.to_not raise_error
  end

    it "can store a capacity value at initialisation" do
      station = DockingStation.new(25)
      expect(station.capacity).to eq 25
  end

  it "can pass on the default capacity if none is initialised" do
    station = DockingStation.new()
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
end



describe "#dock" do
    let(:bike) { Bike.new }
    let(:station) { DockingStation.new(35) }
    it "allows correct number of bikes to be docked when custom capacity has been set" do
      35.times { station.dock(bike) }
      expect { station.dock(bike) }.to raise_error 'Error: this docking station is occupied.'
    end
  end

describe "#release_bike" do
      it 'raises an exception when user tries to release a bike from an empty docking station' do
        expect { subject.release_bike}.to raise_error 'Error: no bikes available at this docking station.'
      end

      it { is_expected.to respond_to :release_bike }

      it 'gets a bike' do
        subject.dock(Bike.new)
        expect(subject.release_bike).to be_an_instance_of Bike
      end

      it 'expects the bike to be working' do
        subject.dock(Bike.new)
        expect(subject.release_bike).to be_working
      end

      it 'fail the release when the bike is broken' do
        bike = Bike.new
        bike.report_broken
        subject.dock bike
        expect { subject.release_bike }.to raise_error "Bike broken"
      end
  end
end
