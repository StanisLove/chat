class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  scope :last_one_hundred, -> { order(created_at: :desc).limit(100).reverse }
end
