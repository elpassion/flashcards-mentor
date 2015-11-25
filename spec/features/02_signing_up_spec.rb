require 'rails_helper'

RSpec.feature 'Browsing Decks', type: :feature do
  SIGN_UP_BUTTON = 'Sign up'

  context 'As an unauthenticated visitor' do
    context "when I click on \"#{SIGN_UP_BUTTON}\" link" do
      background do
        visit '/'
        click_link_or_button SIGN_UP_BUTTON
      end

      feature 'I can create new user account, so that I have access to all app features' do
        it '' do

        end
      end
    end
  end
end
