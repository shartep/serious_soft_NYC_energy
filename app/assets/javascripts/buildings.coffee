# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$( ->
  $('.year_select, .measurement_select').change (e) ->
    building = $(e.target).closest('tr')

    year = building.find('.year_select').val()
    measurement_id = building.find('.measurement_select').val()
    building_id = building.attr('id')

    url = "/energy_usages/total_for_year_building_measurement.json?building_id=#{building_id}&measurement_id=#{measurement_id}&year=#{year}"
    $.get url, (data, status, jqXHR) ->
      building.find('.total_value').text(data)
)
