require 'rails_helper'

describe 'admin user' do
  context 'creating new category' do
    it 'should create new category' do
      name = 'wow'
      email = 'wow@gmail.com'
      password = 'secret'
      title = 'Cool Category'
      admin = User.create!(name: name, email: email, password: password, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_category_path

      fill_in 'category[title]', with: title
      click_button 'Create Category'

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_link(title)
    end
  end
  context 'as default user' do
    it 'does not allow me to see admin categories creation page' do
      user = User.create(name: 'Bob', email: 'bob@example.com', password: 'secret1233', role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_category_path

      expect(page).to_not have_content('Categories')
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
