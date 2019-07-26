# frozen_string_literal: true

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
      20.times {subject.dock(Bike.new)}
      expect { subject.dock(Bike.new) }.to raise_error "Station at full capacity, can't dock bike"
    end
  end

end
