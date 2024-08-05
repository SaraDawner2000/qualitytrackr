class CreateParts < ActiveRecord::Migration[7.0]
  def change
    create_table :parts do |t|
      t.string :part_number, null: false
      t.string :revision, null: false
      t.string :job
      t.string :base_material
      t.string :finish
      t.boolean :measured_status, mull: false, default: false
      t.index [:part_number, :revision], unique: true

      t.timestamps
    end
  end
end
