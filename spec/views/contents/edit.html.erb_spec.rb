require 'spec_helper'

describe "contents/edit.html.erb" do
  before(:each) do
    @content = assign(:content, stub_model(Content,
      :new_record? => false,
      :body => "MyText",
      :position => 1,
      :content_type => "MyString"
    ))
  end

  it "renders the edit content form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => content_path(@content), :method => "post" do
      assert_select "textarea#content_body", :name => "content[body]"
      assert_select "input#content_position", :name => "content[position]"
      assert_select "input#content_content_type", :name => "content[content_type]"
    end
  end
end
