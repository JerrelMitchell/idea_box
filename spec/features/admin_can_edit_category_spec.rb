require 'rails_helper'

describe 'admin user' do
  context 'editing existing category' do
    it 'should edit category' do
      name = 'wow'
      email = 'wow@gmail.com'
      password = 'secret'
      title = 'Cool!'
      new_title = 'Not Cool'
      admin = User.create!(name: name, email: email, password: password, role: 1)
      category = admin.categories.create!(title: title)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_category_path(category)

      expect(page).to have_link 'Edit'
      expect(page).to have_content(title)

      click_on 'Edit'

      expect(current_path).to eq(edit_admin_category_path(category))

      fill_in 'category[title]', with: new_title
      click_button 'Create Category'

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_link(new_title)
      expect(page).to_not have_link(title)
    end
  end
end
