require 'rails_helper'

describe 'admin user' do
  context 'deleting existing category' do
    it 'should delete category' do
      name = 'wow'
      email = 'wow@gmail.com'
      password = 'secret'
      title = 'Cool!'
      admin = User.create!(name: name, email: email, password: password, role: 1)
      category = admin.categories.create!(title: title)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_category_path(category)

      expect(page).to have_link 'Delete'
      expect(page).to have_content(title)

      click_on 'Delete'

      expect(current_path).to eq(admin_categories_path)
      expect(page).to_not have_link(title)
    end
  end
end
