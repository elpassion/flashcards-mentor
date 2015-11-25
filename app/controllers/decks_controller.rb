class DecksController < ApplicationController
  def index
    @decks = Deck.includes(:categories).order(:name).distinct.all
  end
end
