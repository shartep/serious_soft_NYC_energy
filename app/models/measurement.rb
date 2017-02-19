class Measurement < ActiveRecord::Base
  has_many :energy_usages, inverse_of: :measurement
  has_many :buildings, through: :energy_usages

  validates_presence_of :name, :unit

  def name_with_unit
    "#{name} (#{unit})"
  end
end
