class Category < ActiveRecord::Base
  has_many :deck_categories,
           dependent: :destroy

  has_many :decks,
           through: :deck_categories

  validates :name,
            presence: true

end
