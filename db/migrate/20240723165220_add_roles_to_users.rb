class AddRolesToUsers < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
      CREATE TYPE role_options AS ENUM ('quality_manager', 'quality_admin', 'qc_tech', 'prod_manager');
    SQL
    add_column :users, :roles, :role_options, null: false, default: "quality_admin"
  end
end
