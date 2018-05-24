require 'rails_helper'

describe 'visitor' do
  context 'logging in' do
    it 'should log in default user and bring them to their ideas page' do
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
      expect(page).to have_link('Log Out')
    end
  end

  context 'fills out registration form' do
    it 'should make a default user account successfully' do
      name = 'wow'
      email = 'wow@gmail.com'

      visit '/'

      click_on 'Sign Up'

      expect(current_path).to eq(new_user_path)

      fill_in :user_name, with: name
      fill_in :user_email, with: email
      fill_in :user_password, with: 'supersecret'

      click_on 'Create User'

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content(name)
    end

    it 'can log out of account after signing in' do
      name1 = 'blipper'
      email1 = 'yeahway@wow.com'
      password1 = 'secret'
      user = User.create!(name: name1, email: email1, password: password1, role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      expect(page).to have_link 'Log Out'

      click_on 'Log Out'

      expect(current_path).to eq(root_path)
    end

    it 'should not allow duplicate user emails' do
      name = 'wow'
      email = 'wow@gmail.com'
      User.create!(name: name, email: email, password: 'secret')

      visit new_user_path

      fill_in :user_name, with: 'Bubs'
      fill_in :user_email, with: email
      fill_in :user_password, with: 'supersecret'

      click_on 'Create User'

      expect(current_path).to eq(users_path)
    end
  end
end
