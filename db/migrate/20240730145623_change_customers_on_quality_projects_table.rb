class ChangeCustomersOnQualityProjectsTable < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
      CREATE TYPE customers AS ENUM ('sparky', 'mctracktor');
    SQL
  end
  change_column :quality_projects, :customer, :customers
end
