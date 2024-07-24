require "rails_helper"

RSpec.describe "parts/show", type: :view do
  before(:each) do
    assign(:part, Part.create!(
      part_number: "Part Number",
      revision: "Revision",
      job: "Job",
      drawing: "Drawing",
      base_material: "Base Material",
      finish: "Finish",
      measured_status: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Part Number/)
    expect(rendered).to match(/Revision/)
    expect(rendered).to match(/Job/)
    expect(rendered).to match(/Drawing/)
    expect(rendered).to match(/Base Material/)
    expect(rendered).to match(/Finish/)
    expect(rendered).to match(/false/)
  end
end
