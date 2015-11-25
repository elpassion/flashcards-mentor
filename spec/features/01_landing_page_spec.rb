require 'rails_helper'

RSpec.feature 'Landing Page Epic', type: :feature do
  APP_NAME        = 'Flashcards'
  APP_TAGLINE     = 'Learn anything, anytime, anywhere!'
  APP_DESCRIPTION = 'With our NASA-approved Spaced Repetition System, you will remember everything in no time!'

  context 'As an unauthenticated visitor' do
    feature 'I can visit the Landing Page, so that I know what the app does' do
      background { visit '/' }

      scenario "Landing Page includes the app name: #{APP_NAME}" do
        expect(page).to have_content(APP_NAME)
      end

      scenario "Landing Page includes the tagline: #{APP_TAGLINE}" do
        expect(page).to have_content(APP_TAGLINE)
      end

      scenario "Landing Page includes longer description of the app: #{APP_DESCRIPTION}" do
        expect(page).to have_content(APP_DESCRIPTION)
      end
    end
  end
end
