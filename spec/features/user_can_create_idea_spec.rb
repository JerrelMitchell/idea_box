require 'rails_helper'

describe 'default user' do
  context 'creating new idea' do
    it 'should create new idea' do
      name = 'wow'
      email = 'wow@gmail.com'
      email2 = 'noway@wow.com'
      password = 'secret'
      title = 'fun title!'
      content = 'Super cool!'
      admin = User.create!(name: name, email: email, password: password, role: 1)
      user = User.create!(name: name, email: email2, password: password, role: 0)
      category = admin.categories.create!(title: 'new')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_user_idea_path(user)

      fill_in 'idea[title]', with: title
      fill_in 'idea[content]', with: content
      click_button 'Create Idea'

      expect(current_path).to eq(user_ideas_path(user))
      expect(page).to have_link(title)
    end
  end
end
