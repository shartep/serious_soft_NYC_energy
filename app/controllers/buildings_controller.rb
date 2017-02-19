class BuildingsController < ApplicationController
  def index
    @buildings = Building.all.includes(:measurements)
  end
end
