# frozen_string_literal: true

require 'docking_station'

describe DockingStation do
    it { is_expected.to respond_to :release_bike }
end