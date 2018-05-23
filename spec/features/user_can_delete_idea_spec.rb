require 'rails_helper'

describe 'default user' do
  context 'deleting existing idea' do
    it 'should destroy idea' do
      name = 'wow'
      email = 'wow@gmail.com'
      email2 = 'noway@wow.com'
      password = 'secret'
      title = 'fun title!'
      content = 'Super cool!'
      admin = User.create!(name: name, email: email, password: password, role: 1)
      user = User.create!(name: name, email: email2, password: password, role: 0)
      category = admin.categories.create!(title: 'new')
      idea = user.ideas.create!(title: title, content: content, category: category)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_idea_path(user, idea)

      expect(page).to have_link 'Delete'
      expect(page).to have_content(title)

      click_on 'Delete'

      expect(current_path).to eq(user_ideas_path(user))
      expect(page).to_not have_content(title)
    end
  end
end
