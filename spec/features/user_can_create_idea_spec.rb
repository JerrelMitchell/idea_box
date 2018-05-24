require 'rails_helper'

describe 'default user' do
  context 'creating new idea' do
    it 'should create new idea' do
      name = 'wow'
      email2 = 'noway@wow.com'
      password = 'secret'
      title = 'fun title!'
      content = 'Super cool!'
      user = User.create!(name: name, email: email2, password: password, role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_user_idea_path(user)

      fill_in 'idea[title]', with: title
      fill_in 'idea[content]', with: content

      click_button 'Create Idea'

      expect(current_path).to eq(user_ideas_path(user))
    end
    it 'will fail if all fields are not filled out' do
      name = 'wow'
      email2 = 'noway@wow.com'
      password = 'secret'
      error = 'Fill in all fields before submitting!'
      user = User.create!(name: name, email: email2, password: password, role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_user_idea_path(user)

      click_button 'Create Idea'
      click_button 'Create Idea'

      expect(page).to have_content(error)
    end
  end
end
