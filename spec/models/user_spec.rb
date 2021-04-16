require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録できる' do
      it "すべて正しく入力できている" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない' do
      it "nameが空" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "emailが空" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "passwordが空" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "password_confirmationが空" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード(確認用)とパスワードの入力が一致しません")
      end
      it "emailに@がない" do
        @user.email = "testtest"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "emailが重複している" do
        another_user = FactoryBot.create(:user)
        @user.email = another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "passwordが全角" do
        @user.password = "あいうえお"
        @user.password_confirmation = "あいうえおか"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字混合で入力してください")
      end
      it "passwordが数字のみ" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字混合で入力してください")
      end
      it "passwordが英語のみ" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字混合で入力してください")
      end
      it "passwordが6文字より少ない" do
        @user.password = "a2345"
        @user.password_confirmation = "a2345"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
    end
  end
end
