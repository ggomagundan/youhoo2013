require 'spec_helper'

describe "articles/show" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
      :user_id => "",
      :title => "Title",
      :content => "Content",
      :popularity => "",
      :photo_id => "Photo"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Title/)
    rendered.should match(/Content/)
    rendered.should match(//)
    rendered.should match(/Photo/)
  end
end
