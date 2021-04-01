require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
    sleep 0.1
  end

  describe 'コメントの保存' do
    context 'コメントが保存されるとき' do
      
      it '入力すると保存される' do
        expect(@comment).to be_valid 
      end
    end
    context 'コメントが保存されないとき' do
      
      
      it 'textが空だとほぞんできないこと' do
       @comment.text = ""
       @comment.valid?
       expect(@comment.errors.full_messages).to include('Textを入力してください')
      end
    end
  end
end
