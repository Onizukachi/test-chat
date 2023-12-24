class Room < ApplicationRecord
  belongs_to :user
  has_many :messages, -> { sorted }, dependent: :destroy

  validates :title, presence: true, uniqueness: true, length: { minimum: 2 }
end
