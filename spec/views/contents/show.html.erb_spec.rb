require 'spec_helper'

describe "contents/show.html.erb" do
  before(:each) do
    @content = assign(:content, stub_model(Content,
      :body => "MyText",
      :position => 1,
      :content_type => "Content Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Content Type/)
  end
end
