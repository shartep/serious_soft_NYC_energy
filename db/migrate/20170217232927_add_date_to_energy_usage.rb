class AddDateToEnergyUsage < ActiveRecord::Migration
  def change
    add_column :energy_usages, :date, :date
  end
end
