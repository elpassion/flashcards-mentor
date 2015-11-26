class RepetitionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deck, except: :index

  def index
    @subscribed_decks = current_user.subscribed_decks.all
    @due_count        = current_user.repetitions.joins(:card).where('repeat OR due IS NULL OR due <= ?', Time.current).group(:deck_id).count
  end

  # TODO: Select
  def new
    repetition = current_user.repetitions.joins(:card).where(cards: { deck_id: @deck }).where('repeat OR due IS NULL OR due <= ?', Time.current).order(:due).take

    if repetition
      @card = repetition.card
    else
      @card = @deck.cards.joins("LEFT OUTER JOIN repetitions ON repetitions.card_id = cards.id AND repetitions.user_id = #{current_user.id}").where(repetitions: { id: nil }).order(:position).take
    end

    render @card ? :new : :no_repetition
  end

  def create
    @card       = @deck.cards.find(params[:card_id])
    @repetition = current_user.repetitions.find_or_initialize_by(card_id: @card.id)

    if params.has_key?('answer_0')
      @repetition.update(due: 15.seconds.since)
    elsif params.has_key?('answer_1')
      @repetition.update(due: 1.minute.since)
    elsif params.has_key?('answer_2')
      @repetition.update(due: 5.minutes.since)
    end

    redirect_to new_deck_repetition_path(@deck)
  end

  private

  def set_deck
    @deck = current_user.subscribed_decks.find(params[:deck_id])
  end

end
