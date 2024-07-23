class CreateSubcomponents < ActiveRecord::Migration[7.0]
  def change
    create_table :subcomponents do |t|
      t.references :parent, null: false, foreign_key: { to_table: :users }, index: true
      t.references :child, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
