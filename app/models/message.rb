class Message < ApplicationRecord
  has_many :user_messages, dependent: :destroy
  has_many :users, through: :message_users
end
