class CreateMesurements < ActiveRecord::Migration
  def change
    create_table :mesurements do |t|
      t.string :name
      t.string :unit

      t.timestamps null: false
    end
  end
end
