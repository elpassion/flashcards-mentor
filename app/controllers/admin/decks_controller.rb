class Admin::DecksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deck, only: [:show, :edit, :update, :destroy]

  def index
    @decks = current_user.authored_decks.order(:name).all
  end

  def new
    @deck = current_user.authored_decks.new
  end

  def create
    @deck = current_user.authored_decks.new(deck_params)

    if @deck.save
      redirect_to [:admin, @deck], notice: 'Deck was successfully created.'
    else
      render :new
    end
  end

  def update
    if @deck.update(deck_params)
      redirect_to [:admin, @deck], notice: 'Deck was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @deck.destroy

    redirect_to admin_decks_url, notice: 'Deck was successfully destroyed.'
  end

  private

  def set_deck
    @deck = current_user.authored_decks.find(params[:id])
  end

  def deck_params
    params.require(:deck).permit(:name, :description)
  end
end
