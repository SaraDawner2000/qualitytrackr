class CreateQualityProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :quality_projects do |t|
      t.references :part, null: false, foreign_key: true
      t.string :customer, null: false
      t.string :customer_request
      t.string :purchase_order
      t.string :inspection_plan
      t.boolean :report_approval, null: false, default: false
      t.string :assembled_record
      t.boolean :record_approval, null: false, default: false


      t.timestamps
    end
    execute <<-SQL
      CREATE TYPE customer_options AS ENUM ('not_ready', 'ready', 'sent', 'approved', 'rejected');
    SQL
    add_column :quality_projects, :customer_approval, :customer_options
  end
end
