require 'rails_helper'

feature 'sign_up' do
  context 'sign up' do
    scenario 'should sign up successfully' do
      visit '/'
      click_link('Sign up')
      fill_in('Username', with: 'testusername')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
  end
end
