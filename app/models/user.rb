class User < ActiveRecord::Base
  has_many :authored_decks,
           class_name: 'Deck',
           dependent:  :destroy

  has_many :subscriptions,
           dependent: :destroy

  has_many :subscribed_decks,
           through: :subscriptions,
           source:  :deck

  has_many :repetitions,
           dependent: :destroy

  has_many :remembered_cards,
           through: :repetitions,
           source:  :card

end
