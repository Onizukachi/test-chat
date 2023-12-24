class User < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :messages
  has_many :likes

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  def name
    name = email.split('@').first.strip
    return email if name.blank?

    name
  end
end
