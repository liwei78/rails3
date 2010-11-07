require 'spec_helper'

describe "pads/edit.html.erb" do
  before(:each) do
    @pad = assign(:pad, stub_model(Pad,
      :new_record? => false,
      :title => "MyString"
    ))
  end

  it "renders the edit pad form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => pad_path(@pad), :method => "post" do
      assert_select "input#pad_title", :name => "pad[title]"
    end
  end
end
