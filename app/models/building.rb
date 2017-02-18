class Building < ActiveRecord::Base

  validates_presence_of :name, :address
end
