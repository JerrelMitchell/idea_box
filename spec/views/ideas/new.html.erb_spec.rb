require 'rails_helper'

RSpec.describe "ideas/new", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "Name",
      :email => "Email",
      :password => "Password"
    ))
    assign(:idea, Idea.new(
      :content => "MyText",
      :user => @user
    ))
  end

  it "renders new idea form" do
    render

    assert_select "form[action=?][method=?]", ideas_path, "post" do

      assert_select "textarea[name=?]", "idea[content]"

      assert_select "input[name=?]", "idea[user_id]"
    end
  end
end
