class Skill < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  has_one_attached :image
  has_many :comments

  with_options presence: true do
    validates :image
    validates :name, :formulation_text, :recipe_text
  end

  validates :category_id, numericality: { other_than: 1 }
end
