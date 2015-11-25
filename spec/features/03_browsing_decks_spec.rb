require 'rails_helper'

RSpec.feature 'Browsing Decks', type: :feature do
  DECKS_BUTTON = 'Decks'

  context 'As an unauthenticated visitor' do
    context "when I click on \"#{DECKS_BUTTON}\" link" do
      background do
        visit '/'
        click_link_or_button DECKS_BUTTON
      end

      feature 'I can see the decks list, so that I know what I can learn' do
        scenario "Deck's title is displayed" do
        end

        scenario "Deck's description is displayed" do
        end

        scenario 'If the description is longer than 30 characters, it is cut and an ellipsis ("...") is appended, eg.: "Elementary English Words And Phrases" -> "Elementary English Words..."' do
        end

        scenario 'The description is cut only on natural breaks (whitespace), never inside a word. Eg.: "Basic English words: one, two, three, etc." -> "Basic English words: one,..." (and not "Basic English words: one, t...")' do
        end

        scenario 'Decks are ordered alphabetically by title (ascending)' do
        end
      end
    end
  end
end
