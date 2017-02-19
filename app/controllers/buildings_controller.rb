class BuildingsController < ApplicationController
  def index
    @buildings = Building.all.includes(:energy_usages, :measurements)
  end
end
