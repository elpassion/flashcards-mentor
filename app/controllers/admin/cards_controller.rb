class Admin::CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deck
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = @deck.cards.order(:position).all
  end

  def new
    @card = @deck.cards.new
  end

  def create
    @card = @deck.cards.new(card_params)

    if @deck.save
      redirect_to [:admin, @deck, @card], notice: 'Card was successfully created.'
    else
      render :new
    end
  end

  def update
    if @card.update(card_params)
      redirect_to [:admin, @deck, @card], notice: 'Card was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @card.destroy

    redirect_to admin_deck_cards_url(@deck), notice: 'Card was successfully destroyed.'
  end

  private

  def set_deck
    @deck = current_user.authored_decks.find(params[:deck_id])
  end

  def set_card
    @card = @deck.cards.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:front, :back)
  end
end
