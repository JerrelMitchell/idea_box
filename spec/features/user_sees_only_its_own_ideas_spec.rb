require 'rails_helper'

describe 'user visits ideas index page' do
  context 'as user' do
    it 'allows me to see all ideas' do
      admin = User.create!(name: 'Bob', email: 'Bob@example.com', password: 'secret', role: 0)
      category = admin.categories.create!(title: 'new')
      user = User.create!(name: 'Jerrel', email: 'yosi@example.com', password: 'secret', role: 1)
      user.ideas.create!(title: 'thing1', content: 'New stuff!', category: category)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_ideas_path(user)

      expect(page).to have_content("#{user.name}'s Ideas")
    end
  end

  context 'as an authenticated but unauthorized user' do
    it 'does not allow me to see other users ideas' do
      admin = User.create!(name: 'Sabrina', email: 'sabrina@example.com', password: 'secret', role: 0)
      category = admin.categories.create!(title: 'new')
      user1 = User.create!(name: 'Bob', email: 'bob@example.com', password: 'secret1233', role: 1)
      user1.ideas.create!(title: 'thing1', content: 'Old', category: category)
      user2 = User.create!(name: 'Jack', email: 'jack@example.com', password: 'secret1233', role: 1)
      user2.ideas.create!(title: 'thing2', content: 'Current', category: category)
      user3 = User.create!(name: 'Sally', email: 'sally@example.com', password: 'secret1233', role: 1)
      user3.ideas.create!(title: 'thing3', content: 'New', category: category)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

      visit user_ideas_path(user2)

      expect(page).to_not have_content("#{user1.name}'s Ideas")
      expect(page).to have_content("The page you were looking for doesn't exist")

      visit user_ideas_path(user3)

      expect(page).to_not have_content("#{user1.name} Ideas")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
