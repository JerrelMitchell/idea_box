require 'rails_helper'

RSpec.describe "ideas/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "Name",
      :email => "Email",
      :password => "Password"
    ))
    @idea = assign(:idea, Idea.create!(
      :content => "MyText",
      :user => @user
    ))
  end

  it "renders the edit idea form" do
    render

    assert_select "form[action=?][method=?]", idea_path(@idea), "post" do

      assert_select "textarea[name=?]", "idea[content]"

      assert_select "input[name=?]", "idea[user_id]"
    end
  end
end
