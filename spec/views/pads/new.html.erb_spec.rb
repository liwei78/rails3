require 'spec_helper'

describe "pads/new.html.erb" do
  before(:each) do
    assign(:pad, stub_model(Pad,
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new pad form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => pads_path, :method => "post" do
      assert_select "input#pad_title", :name => "pad[title]"
    end
  end
end
