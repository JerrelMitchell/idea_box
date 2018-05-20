require 'rails_helper'

RSpec.describe "ideas/show", type: :view do
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

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
