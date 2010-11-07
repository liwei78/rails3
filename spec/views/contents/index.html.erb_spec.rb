require 'spec_helper'

describe "contents/index.html.erb" do
  before(:each) do
    assign(:contents, [
      stub_model(Content,
        :body => "MyText",
        :position => 1,
        :content_type => "Content Type"
      ),
      stub_model(Content,
        :body => "MyText",
        :position => 1,
        :content_type => "Content Type"
      )
    ])
  end

  it "renders a list of contents" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content Type".to_s, :count => 2
  end
end
