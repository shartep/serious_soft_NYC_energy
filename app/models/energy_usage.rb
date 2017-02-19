class EnergyUsage < ActiveRecord::Base
  belongs_to :building, inverse_of: :energy_usages
  belongs_to :measurement, inverse_of: :energy_usages

  scope :for_building,    -> (building_id)    { where(building_id: building_id) }
  scope :for_measurement, -> (measurement_id) { where(measurement_id: measurement_id) }
  scope :during_year,     -> (year)        { where(date: Date.new(year)..Date.new(year).end_of_year) }

  def self.for_building_mes_year(building_id, measurement_id, year)
    for_building(building_id).
        for_measurement(measurement_id).
        during_year(year).
        sum(:value).
        round(2)
  end
end
