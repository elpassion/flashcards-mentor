require 'rails_helper'

RSpec.feature 'Landing Page Epic', type: :feature do
  context 'As an unauthenticated visitor' do
    feature 'I can visit the Landing Page' do
      background { visit '/' }

      scenario 'so that I know the app name' do
        expect(page).to have_content('Flashcards')
      end

      scenario 'so that I am astonished by the app tagline' do
        expect(page).to have_content('Any language, anytime, anywhere!')
      end

      scenario 'so that I know what the app does' do
        expect(page).to have_content('With our NASA-approved Spaced Repetition System, you will remember everything in no time!')
      end
    end
  end
end
