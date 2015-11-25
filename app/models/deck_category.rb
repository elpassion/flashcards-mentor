class DeckCategory < ActiveRecord::Base
  belongs_to :deck,
             counter_cache: :categories_count,
             required:      true

  belongs_to :category,
             counter_cache: :decks_count,
             required:      true

  validates :deck_id,
            uniqueness: { scope: :category_id }

end
