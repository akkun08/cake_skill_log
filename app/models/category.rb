class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: "--" },
    { id: 2, name: "焼き菓子" },
    { id: 3, name: "生菓子" },
    { id: 4, name: "その他" },

  ]

  include ActiveHash::Associations
  has_many :skills
end
