class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :name
      t.string :unit

      t.timestamps null: false
    end
  end
end
