class Repetition < ActiveRecord::Base
  belongs_to :user,
             counter_cache: :remembered_cards_count,
             required:      true

  belongs_to :card,
             counter_cache: :remembered_by_count,
             required:      true

  validates :user_id,
            uniqueness: { scope: :card_id }

end
