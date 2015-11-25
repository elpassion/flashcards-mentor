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

  validates :first_name, :last_name,
            length:   { maximum: 255 },
            presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
