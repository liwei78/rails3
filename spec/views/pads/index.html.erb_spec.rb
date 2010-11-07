require 'spec_helper'

describe "pads/index.html.erb" do
  before(:each) do
    assign(:pads, [
      stub_model(Pad,
        :title => "Title"
      ),
      stub_model(Pad,
        :title => "Title"
      )
    ])
  end

  it "renders a list of pads" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
