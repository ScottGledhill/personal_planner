require 'rails_helper'

feature 'Events' do
  context 'creating an event' do
    before do
      visit '/'
      click_link('Sign up')
      fill_in('Username', with: 'testusername')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    scenario 'prompts user to fill out a form, then displays the new restaurant' do
      click_button 'Add a new event'
      fill_in 'event_date', with: '02/22/2022'
      fill_in 'event_place', with: 'Test Arena'
      fill_in 'event_event', with: 'Test Event'
      attach_file('event_image', Rails.root + "app/assets/images/landing_page.png")
      click_button('Create Event')
    end
  end
end
