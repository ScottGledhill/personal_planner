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

  context 'sign in' do
    before do
      visit '/'
      click_link('Sign up')
      fill_in('Username', with: 'testusername')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
      click_link('Sign out')
    end

    scenario 'should sign in successfully' do
      click_link('Sign in')
      fill_in('Login', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      click_button('Log in')
      expect(page).to have_content 'Signed in successfully.'
    end

    scenario 'should sign out successfully' do
      expect(page).to have_content 'Signed out successfully.'
    end
  end
end
