class Message < ApplicationRecord
  has_many :likes, dependent: :destroy
  belongs_to :user
  belongs_to :room

  scope :sorted, -> { order(:id) }
  validates :body, presence: true

  after_create_commit -> {
    broadcast_append_to(
      'toasts',
      target: "toasts",
      partial: 'shared/toast',
      locals: { message: self }
      )
  }
end
