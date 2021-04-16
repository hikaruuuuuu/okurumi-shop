require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品購入' do
    before do
      item = FactoryBot.create(:item)
      @user_order = FactoryBot.build(:user_order, item_id: item.id)
    end
    context '購入できる' do
      it "すべて正しく入力できている" do
        expect(@user_order).to be_valid
      end
    end
    context '購入できない' do
      it "first_nameが空" do
        @user_order.first_name = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("名字を入力してください")
      end
      it "last_nameが空" do
        @user_order.last_name = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("名前を入力してください")
      end
      it "post_codeが空" do
        @user_order.post_code = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it "prefecture_idが空" do
        @user_order.prefecture_id = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("都道府県を入力してください")
      end
      it "addressが空" do
        @user_order.address = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("住所を入力してください")
      end
      it "building_numberが空" do
        @user_order.building_number = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("番地を入力してください")
      end
      it "phone_numberが空" do
        @user_order.phone_number = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("電話番号を入力してください")
      end
      it "tokenが空" do
        @user_order.token = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("カード情報を入力してください")
      end
      it "itemがひもづいていない" do
        @user_order.item_id = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
