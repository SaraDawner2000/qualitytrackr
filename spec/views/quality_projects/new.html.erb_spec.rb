require 'rails_helper'

RSpec.describe "quality_projects/new", type: :view do
  before(:each) do
    assign(:quality_project, QualityProject.new(
      part: nil,
      customer: "MyString",
      customer_request: "MyString",
      purchase_order: "MyString",
      inspection_plan: "MyString",
      report_approval: false,
      assembled_record: false,
      customer_approval: false
    ))
  end

  it "renders new quality_project form" do
    render

    assert_select "form[action=?][method=?]", quality_projects_path, "post" do

      assert_select "input[name=?]", "quality_project[part_id]"

      assert_select "input[name=?]", "quality_project[customer]"

      assert_select "input[name=?]", "quality_project[customer_request]"

      assert_select "input[name=?]", "quality_project[purchase_order]"

      assert_select "input[name=?]", "quality_project[inspection_plan]"

      assert_select "input[name=?]", "quality_project[report_approval]"

      assert_select "input[name=?]", "quality_project[assembled_record]"

      assert_select "input[name=?]", "quality_project[customer_approval]"
    end
  end
end
