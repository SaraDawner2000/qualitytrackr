class CreateQualityProjects < ActiveRecord::Migration[7.0]
  def change
    create_enum :customer_options, ["unready", "ready", "sent", "approved", "rejected"]
    create_enum :customers, ["sparky", "mctractor"]

    create_table :quality_projects do |t|
      t.references :part, null: false, foreign_key: true
      t.string :customer, null: false
      t.string :customer_request
      t.string :purchase_order
      t.boolean :report_approval, null: false, default: false
      t.boolean :record_approval, null: false, default: false


      t.timestamps
    end


    add_column :quality_projects, :customer_approval, :customer_options, default: "unready"
  end
end
