class Subscription < ActiveRecord::Base
  belongs_to :user,
             counter_cache: :subscribed_decks_count,
             required:      true

  belongs_to :deck,
             counter_cache: :subscribed_users_count,
             required:      true

  validates :user_id,
            uniqueness: { scope: :deck_id }

end
