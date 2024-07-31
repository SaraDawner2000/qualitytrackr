class AddRolesToUsers < ActiveRecord::Migration[7.0]
  def change
    create_enum :role_options, ["quality_manager", "quality_admin", "qc_tech", "prod_manager"]

    add_column :users, :roles, :role_options, null: false, default: "quality_admin"
  end
end
