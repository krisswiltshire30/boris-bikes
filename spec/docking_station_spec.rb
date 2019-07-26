require './lib/docking_station'
require './lib/bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'has a method dock' do
      expect(subject).to respond_to :dock
  end

  it 'has a method bike that returns a bike' do
    expect(subject).to respond_to :bikes
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes.last).to eq(bike)
  end

  describe '#release_bike' do
    it 'Releases correct bike' do
      bike = Bike.new
      subject.dock(bike)
      expect( subject.release_bike ).to eq subject.bikes.first
    end

    it 'raises and error when no bikes are available' do
      expect {subject.release_bike}.to raise_error 'No bike available'
    end
  end

  # it { is_expected.to respond_to :full? }
  #
  # it { is_expected.to respond_to :empty? }

  describe '#dock' do
    it 'raises an error when a bike is already docked' do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
      expect { subject.dock(Bike.new) }.to raise_error "Station at full capacity, can't dock bike"
    end
  end

  describe 'Set capacity when create new docking station, default to DEFAULT_CAPACITY' do


    it 'capacity set to default when no argument is given' do
      docking_station = DockingStation.new()
      DockingStation::DEFAULT_CAPACITY.times { docking_station.dock(Bike.new)}
      expect{docking_station.dock(Bike.new)}.to raise_error
    end


    
    it 'capacity set to 5' do
      docking_station = DockingStation.new(5)
      5.times { docking_station.dock(Bike.new)}
      expect{docking_station.dock(Bike.new)}.to raise_error
    end


  end

end
