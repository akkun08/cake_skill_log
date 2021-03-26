require "rails_helper"

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージの保存' do
    context 'メッセージを送信すると保存できる' do
      it '入力して送信すると保存できる' do
        expect(@message).to be_valid
      end
    end
    context 'メッセージが保存できないとき' do
      it 'contentが空だと保存できない' do
        @message.content = ""
        @message.valid?
        expect(@message.errors.full_messages).to include("Contentを入力してください")
      end
      it 'userが紐付いていないと保存ができないこと' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('Userを入力してください')
      end
      it 'roomが紐付いていないと保存ができないこと' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('Roomを入力してください')
      
      end
      
    end

  end
end
