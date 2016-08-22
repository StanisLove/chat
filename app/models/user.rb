class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :chatroom_users
  has_many :messages
  has_many :chatrooms, through: :chatroom_users

  validates :password, length: { minimum: 6 },      if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true,          if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, :username, uniqueness: true
end
