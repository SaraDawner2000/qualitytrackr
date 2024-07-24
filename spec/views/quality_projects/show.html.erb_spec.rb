require "rails_helper"

RSpec.describe "quality_projects/show", type: :view do
  before(:each) do
    assign(:quality_project, QualityProject.create!(
      part: nil,
      customer: "Customer",
      customer_request: "Customer Request",
      purchase_order: "Purchase Order",
      inspection_plan: "Inspection Plan",
      report_approval: false,
      assembled_record: false,
      customer_approval: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Customer/)
    expect(rendered).to match(/Customer Request/)
    expect(rendered).to match(/Purchase Order/)
    expect(rendered).to match(/Inspection Plan/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
