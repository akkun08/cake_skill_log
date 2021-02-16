require "rails_helper"

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'すべて入力できると登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上であると登録できる' do
        @user.password = "111aaa"
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = "111aaa"
        @user.password_confirmation = "111aaa"
        expect(@user).to be_valid
      end
      
    end
    context '新規登録できない時' do
      it 'nameが空では登録できない' do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードPassword is invalid", "パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが存在しても、password_confirmationが空では登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'passwordが５文字以下では登録できない' do
        @user.password = "11111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください", "パスワードPassword is invalid")
      end
      it 'passwordが半角英語(6桁)のみでは登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードPassword is invalid")
      end
      it 'passwordが全角英数混合(6桁)は登録できない' do
        @user.password = "１１１１１Ａ"
        @user.password_confirmation = "１１１１１Ａ"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードPassword is invalid")
      end
      it 'emailに@がない場合は登録できない' do
        @user.email = "acom"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

    end
  end
  
  
end
