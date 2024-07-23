require 'rails_helper'

RSpec.describe "parts/edit", type: :view do
  let(:part) {
    Part.create!(
      part_number: "MyString",
      revision: "MyString",
      job: "MyString",
      drawing: "MyString",
      base_material: "MyString",
      finish: "MyString",
      measured_status: false
    )
  }

  before(:each) do
    assign(:part, part)
  end

  it "renders the edit part form" do
    render

    assert_select "form[action=?][method=?]", part_path(part), "post" do

      assert_select "input[name=?]", "part[part_number]"

      assert_select "input[name=?]", "part[revision]"

      assert_select "input[name=?]", "part[job]"

      assert_select "input[name=?]", "part[drawing]"

      assert_select "input[name=?]", "part[base_material]"

      assert_select "input[name=?]", "part[finish]"

      assert_select "input[name=?]", "part[measured_status]"
    end
  end
end
