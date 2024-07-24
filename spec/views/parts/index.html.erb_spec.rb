require "rails_helper"

RSpec.describe "parts/index", type: :view do
  before(:each) do
    assign(:parts, [
      Part.create!(
        part_number: "Part Number",
        revision: "Revision",
        job: "Job",
        drawing: "Drawing",
        base_material: "Base Material",
        finish: "Finish",
        measured_status: false
      ),
      Part.create!(
        part_number: "Part Number",
        revision: "Revision",
        job: "Job",
        drawing: "Drawing",
        base_material: "Base Material",
        finish: "Finish",
        measured_status: false
      )
    ])
  end

  it "renders a list of parts" do
    render
    cell_selector = Rails::VERSION::STRING >= "7" ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("Part Number".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Revision".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Job".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Drawing".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Base Material".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Finish".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
