require 'rails_helper'

describe 'existing user' do
  context 'logging in' do
    it 'can visit account page' do
      name = 'wow'
      email = 'wow@gmail.com'
      password = 'secret'
      user = User.create!(name: name, email: email, password: password)

      visit '/'
      click_on 'Log In'

      expect(current_path).to eq(login_path)

      fill_in :email, with: email
      fill_in :password, with: password
      click_button 'Log In'

      expect(current_path).to eq(user_ideas_path(user))
      expect(page).to have_link('Account Settings')

      click_on 'Account Settings'

      expect(current_path).to eq(user_account_path(user))
    end
    it 'can edit account details from account page' do
      name1 = 'blipper'
      name2 = 'boo'
      email1 = 'yeahway@wow.com'
      email2 = 'noway@wow.com'
      password1 = 'secret'
      password2 = 'superdood'
      user = User.create!(name: name1, email: email1, password: password1, role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_account_path(user)

      expect(page).to have_link 'Edit Profile'

      click_on 'Edit Profile'

      expect(current_path).to eq(edit_user_path(user))

      fill_in 'user[name]', with: name2
      fill_in 'user[email]', with: email2
      fill_in 'user[password]', with: password2

      click_on 'Update User'

      expect(current_path).to eq(user_path(user))
    end
    it 'can delete account from account page' do
      notice = 'Sad to see you go. Rejoin anytime!'
      name1 = 'blipper'
      email1 = 'yeahway@wow.com'
      password1 = 'secret'
      user = User.create!(name: name1, email: email1, password: password1, role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_account_path(user)

      expect(page).to have_link 'Delete Profile'

      click_on 'Delete Profile'

      expect(current_path).to eq(root_path)
      expect(page).to have_content(notice)
    end

    it 'can cannot submit editing account if fields are left empty' do
      error = 'Fill in all fields before submitting!'
      name1 = 'blipper'
      email1 = 'yeahway@wow.com'
      password1 = 'secret'
      user = User.create!(name: name1, email: email1, password: password1, role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit edit_user_path(user)

      fill_in 'user[name]', with: ''

      click_on 'Update User'
      click_on 'Update User'

      expect(page).to have_content(error)
    end
  end
end
