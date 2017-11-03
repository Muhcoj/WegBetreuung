require 'rails_helper'

describe 'user navigation' do
  describe 'creation' do
    it 'can register with full set of user attributes' do
      visit new_user_registration_path

      fill_in 'user[email]', with: "test@test.com"
      fill_in 'user[password]', with: "Password"
      fill_in 'user[password_confirmation]', with: "Password"
      fill_in 'user[first_name]', with: "Don"
      fill_in 'user[last_name]', with: "Johnson"

      click_on "Sign up"

      expect(page).to have_content("Welcome")
    end
  end
end 