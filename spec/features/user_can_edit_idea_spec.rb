require 'rails_helper'

describe 'default user' do
  context 'editing existing idea' do
    it 'should edit idea' do
      name = 'wow'
      email2 = 'noway@wow.com'
      password = 'secret'
      title = 'fun title!'
      title2 = 'New Title'
      content = 'Super cool!'
      content2 = 'New Content'
      user = User.create!(name: name, email: email2, password: password, role: 0)
      idea = user.ideas.create!(title: title, content: content)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_idea_path(user, idea)

      expect(page).to have_link 'Edit'
      expect(page).to have_content(title)

      click_on 'Edit'

      expect(current_path).to eq(edit_user_idea_path(user, idea))

      fill_in 'idea[title]', with: title2
      fill_in 'idea[content]', with: content2

      click_on 'Update Idea'

      expect(current_path).to eq(user_ideas_path(user))
      expect(page).to_not have_content(title)
      expect(page).to have_content(title2)
    end

    it 'must fill out all fields before submitting form' do
      name = 'wow'
      email2 = 'noway@wow.com'
      password = 'secret'
      title = 'fun title!'
      content = 'Super cool!'
      error = 'Fill in all fields before submitting!'
      user = User.create!(name: name, email: email2, password: password, role: 0)
      idea = user.ideas.create!(title: title, content: content)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit edit_user_idea_path(user, idea)

      fill_in 'idea[title]', with: ''

      click_on 'Update Idea'
      click_on 'Update Idea'

      expect(page).to have_content(error)
    end
  end
end
