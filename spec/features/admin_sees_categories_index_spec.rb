require 'rails_helper'

describe 'user visits categories index page' do
  context 'as admin' do
    it 'allows me to see all categories' do
      admin = User.create(name: 'Jerrel', email: 'yosi@example.com', password: 'secret', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      expect(page).to have_content('Categories')
    end
  end
end
