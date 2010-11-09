require 'spec_helper'

describe "pads/show.html.erb" do
  before(:each) do
    @pad = assign(:pad, stub_model(Pad,
      :title => "Title"
    ))
    @tags = Tag.all
    @contents = @pad.contents
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
