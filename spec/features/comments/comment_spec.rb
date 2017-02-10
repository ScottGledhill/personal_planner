require 'rails_helper'

feature 'Comments' do
  context 'creating a comment' do
    before do
      visit '/'
      click_link('Sign up')
      fill_in('Username', with: 'testusername')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
      click_button 'Add a new event'
      fill_in 'event_date', with: '02/22/2022'
      fill_in 'event_place', with: 'Test Arena'
      fill_in 'event_event', with: 'Test Event'
      attach_file('event_image', Rails.root + "app/assets/images/landing_page.png")
      click_button('Create Event')
      click_link 'Test Event'
    end

    scenario 'can add a comment' do
      click_link 'Add a comment'
      fill_in 'comment_body', with: 'first comment'
      click_button('Create Comment')
      expect(page).to have_content 'first comment'
    end

    scenario 'can edit a comment' do
      click_link 'Add a comment'
      fill_in 'comment_body', with: 'first comment'
      click_button('Create Comment')
      click_link 'Edit'
      fill_in 'comment_body', with: 'edited comment'
      click_button('Update Comment')
      expect(page).to have_content 'edited comment'
    end
  end
end
