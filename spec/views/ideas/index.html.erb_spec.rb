require 'rails_helper'

RSpec.describe "ideas/index", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "Name",
      :email => "Email",
      :password => "Password"
    ))
    assign(:ideas, [
      Idea.create!(
        :content => "MyText",
        :user => @user
      ),
      Idea.create!(
        :content => "MyText",
        :user => @user
      )
    ])
  end

  it "renders a list of ideas" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
