require 'spec_helper'

describe "articles/edit" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
      :user_id => "",
      :title => "MyString",
      :content => "MyString",
      :popularity => "",
      :photo_id => "MyString"
    ))
  end

  it "renders the edit article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => articles_path(@article), :method => "post" do
      assert_select "input#article_user_id", :name => "article[user_id]"
      assert_select "input#article_title", :name => "article[title]"
      assert_select "input#article_content", :name => "article[content]"
      assert_select "input#article_popularity", :name => "article[popularity]"
      assert_select "input#article_photo_id", :name => "article[photo_id]"
    end
  end
end
