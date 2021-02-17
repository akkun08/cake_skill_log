require "rails_helper"

RSpec.describe Skill, type: :model do
  before do
    @skill = FactoryBot.build(:skill)
  end

  describe 'スキル投稿の保存' do
    context 'スキル投稿が保存できる時' do
      it 'すべて入力されると保存できる' do
        expect(@skill).to be_valid
      end
    end
    context 'スキル投稿が保存できない時' do
      it 'imageが空だと保存できないこと' do
        @skill.image = nil 
        @skill.valid?
        expect(@skill.errors.full_messages).to include("Imageを入力してください")
      end
      it 'nameが空だと保存できないこと' do
        @skill.name = ""
        @skill.valid?
        expect(@skill.errors.full_messages).to include("Nameを入力してください")
      end
      it 'formulation_textが空だと保存できないこと' do
        @skill.formulation_text = ""
        @skill.valid?
        expect(@skill.errors.full_messages).to include("Formulation textを入力してください")
      end
      it 'recipe_textが空だと保存できないこと' do
        @skill.recipe_text = ""
        @skill.valid?
        expect(@skill.errors.full_messages).to include("Recipe textを入力してください")
      end
      
    end

  end
end
