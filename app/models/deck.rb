class Deck < ActiveRecord::Base
  belongs_to :author,
             class_name:    'User',
             inverse_of:    :authored_decks,
             counter_cache: :authored_decks_count,
             required:      true

  has_many :cards,
           dependent: :destroy

  has_many :deck_categories,
           dependent: :destroy

  has_many :categories,
           through: :deck_categories

  has_many :subscriptions,
           dependent: :destroy

  has_many :subscribed_users,
           through: :subscriptions,
           source:  :user

  validates :name,
            length:   { maximum: 255 },
            presence: true

  validates :description,
            presence: true

end
