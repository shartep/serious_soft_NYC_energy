class Measurement < ActiveRecord::Base

  validates_presence_of :name, :unit
end
