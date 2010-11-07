require 'spec_helper'

describe "contents/new.html.erb" do
  before(:each) do
    assign(:content, stub_model(Content,
      :body => "MyText",
      :position => 1,
      :content_type => "MyString"
    ).as_new_record)
  end

  it "renders new content form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => contents_path, :method => "post" do
      assert_select "textarea#content_body", :name => "content[body]"
      assert_select "input#content_position", :name => "content[position]"
      assert_select "input#content_content_type", :name => "content[content_type]"
    end
  end
end
