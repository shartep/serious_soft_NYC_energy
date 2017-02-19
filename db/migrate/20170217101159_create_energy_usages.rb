class CreateEnergyUsages < ActiveRecord::Migration
  def change
    create_table :energy_usages do |t|
      t.decimal :value, precision: 20, scale: 5
      t.references :building, index: true
      t.references :measurement, index: true

      t.timestamps null: false
    end
    add_foreign_key :energy_usages, :buildings
    add_foreign_key :energy_usages, :measurements
  end
end
