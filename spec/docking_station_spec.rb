# frozen_string_literal: true

require './lib/docking_station'
require './lib/bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
  bike = subject.release_bike
  expect(bike).to be_working
end

end
