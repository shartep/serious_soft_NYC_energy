require 'json'

file = File.read 'db/seed_data.json'
data_hash = JSON.parse file

MONTH_MAP = {
    jan: 1,
    feb: 2,
    mar: 3,
    apr: 4,
    may: 5,
    jun: 6,
    jul: 7,
    aug: 8,
    sep: 9,
    oct: 10,
    nov: 11,
    dec: 12
}

data_hash.each do |data|
  if (location = data['location_1_location'].presence) && (mes = data['measurement'].presence)
    name = location[/\[(.*?)\]/, 1]
    address = location.gsub(/\[(.*?)\]/, '').strip
    building = Building.find_or_create_by name: name, address: address

    mes_unit = mes[/\((.*?)\)/, 1]
    mes_name = mes.gsub(/\((.*?)\)/, '').strip
    mesurement = Mesurement.find_or_create_by name: mes_name, unit: mes_unit

    if building.present? && mesurement.present?
      data.each do |k, v|
        month, year = k.split '_'
        if MONTH_MAP.keys.include?(month.to_sym) && (8...17).include?(year.to_i) && v.present?
          EnergyUsage.create value: v, date: Date.new(year.to_i + 2000, MONTH_MAP[month.to_sym]), building: building, mesurement: mesurement
        end
      end
    end
    puts '.'
  end
end
