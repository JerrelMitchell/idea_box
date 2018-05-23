require 'rails_helper'

describe 'user visits categories index page' do
  context 'as admin' do
    it 'allows me to see all categories' do
      admin = User.create(name: 'Jerrel', email: 'yosi@example.com', password: 'secret', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      expect(page).to have_content('Admin Categories')
    end
  end

  context 'as default user' do
    it 'does not allow me to see admin categories' do
      user = User.create(name: 'Bob', email: 'bob@example.com', password: 'secret1233', role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path

      expect(page).to_not have_content('Admin Categories')
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
