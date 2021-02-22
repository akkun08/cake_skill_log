class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :skill

  validates :text, presence: true
end
