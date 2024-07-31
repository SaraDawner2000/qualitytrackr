class ChangeCustomersOnQualityProjectsTable < ActiveRecord::Migration[7.0]
  def change
    create_enum :customers, ["sparky", "mctractor"]

    remove_column :quality_projects, :customer, :string

    add_column :quality_projects, :customer, :customers
  end
end
