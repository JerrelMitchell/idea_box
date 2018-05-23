require 'rails_helper'

describe 'default user' do
  context 'editing existing idea' do
    it 'should edit idea' do
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

      expect(page).to have_link 'Edit'
      expect(page).to have_content(title)

      click_on 'Edit'

      expect(current_path).to eq(edit_user_idea_path(user, idea))
    end
  end
end
