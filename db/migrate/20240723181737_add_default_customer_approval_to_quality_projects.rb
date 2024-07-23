class AddDefaultCustomerApprovalToQualityProjects < ActiveRecord::Migration[7.0]
  def change
    change_column_default :quality_projects, :customer_approval, from: nil, to: "not_ready"
  end
end
