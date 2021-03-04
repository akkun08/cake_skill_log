class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i.freeze
  validates_format_of :password, presence: true, with: PASSWORD_REGEX, message: "Password is invalid"

  validates :name, presence: true

  has_many :skills
  has_many :comments
  has_many :messages, through: :message_users, dependent: :destroy
  has_many :message_users
  has_one :purchase
end
