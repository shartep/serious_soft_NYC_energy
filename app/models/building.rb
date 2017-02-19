class Building < ActiveRecord::Base
  has_many :energy_usages, inverse_of: :building
  has_many :measurements, through: :energy_usages

  validates_presence_of :name, :address
end
