class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.integer :category_id, null: false
      t.text :formulation_text, null: false
      t.text :recipe_text, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
