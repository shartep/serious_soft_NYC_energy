class EnergyUsagesController < ApplicationController
  def total_for_year_building_measurement
    total = EnergyUsage.for_building_mes_year(params[:building_id].to_i,
                                              params[:measurement_id].to_i,
                                              params[:year].to_i)
    render json: total
  end
end
