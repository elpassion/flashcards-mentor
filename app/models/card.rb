class Card < ActiveRecord::Base
  belongs_to :deck,
             counter_cache: true,
             required:      true

  has_many :repetitions,
           dependent: :destroy

  has_many :remembered_by,
           through: :repetitions,
           source:  :user

  validates :front, :back,
            presence: true

end
