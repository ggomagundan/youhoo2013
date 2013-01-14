require 'spec_helper'

describe "articles/index" do
  before(:each) do
    assign(:articles, [
      stub_model(Article,
        :user_id => "",
        :title => "Title",
        :content => "Content",
        :popularity => "",
        :photo_id => "Photo"
      ),
      stub_model(Article,
        :user_id => "",
        :title => "Title",
        :content => "Content",
        :popularity => "",
        :photo_id => "Photo"
      )
    ])
  end

  it "renders a list of articles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Photo".to_s, :count => 2
  end
end
