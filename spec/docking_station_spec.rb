# frozen_string_literal: true

require './lib/docking_station'
require './lib/bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'has a method dock' do
      expect(subject).to respond_to :dock
  end

  it 'has a method bike that returns a bike' do
    expect(subject).to respond_to :bike
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq(bike)
  end

  describe '#release_bike' do
    it 'Releases correct bike' do
      bike = Bike.new
      subject.dock(bike)
      expect( subject.release_bike ).to eq bike
    end

    it 'raises and error when no bikes are available' do
      expect {subject.release_bike}.to raise_error 'No bike available'
    end
  end

end
