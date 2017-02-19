class EnergyUsage < ActiveRecord::Base
  belongs_to :building, inverse_of: :energy_usages
  belongs_to :measurement, inverse_of: :energy_usages

  scope :for_building,    -> (building)    { where(building: building) }
  scope :for_measurement, -> (measurement) { where(measurement: measurement) }
  scope :during_year,     -> (year)        { where(date: Date.new(year)..Date.new(year).end_of_year) }
end
