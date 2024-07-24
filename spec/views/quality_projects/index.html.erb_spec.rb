require "rails_helper"

RSpec.describe "quality_projects/index", type: :view do
  before(:each) do
    assign(:quality_projects, [
      QualityProject.create!(
        part: nil,
        customer: "Customer",
        customer_request: "Customer Request",
        purchase_order: "Purchase Order",
        inspection_plan: "Inspection Plan",
        report_approval: false,
        assembled_record: false,
        customer_approval: false
      ),
      QualityProject.create!(
        part: nil,
        customer: "Customer",
        customer_request: "Customer Request",
        purchase_order: "Purchase Order",
        inspection_plan: "Inspection Plan",
        report_approval: false,
        assembled_record: false,
        customer_approval: false
      )
    ])
  end

  it "renders a list of quality_projects" do
    render
    cell_selector = Rails::VERSION::STRING >= "7" ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Customer".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Customer Request".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Purchase Order".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Inspection Plan".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
