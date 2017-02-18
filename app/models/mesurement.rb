class Mesurement < ActiveRecord::Base

  validates_presence_of :name, :unit
end
