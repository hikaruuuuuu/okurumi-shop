require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品登録' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '商品登録ができる' do
      it "すべて正しく入力できている" do
        expect(@item).to be_valid
      end
    end
    context '商品登録ができない' do
      it "nameが空" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "descriptionが空" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it "priceが空" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品金額は¥1〜9,999,999に設定してください")
      end
      it "priceが全角" do
        @item.price = "１２３４５"
        @item.valid?
        expect(@item.errors.full_messages).to include("商品金額は¥1〜9,999,999に設定してください")
      end
      it "priceが数字でない" do
        @item.price = "abcdef"
        @item.valid?
        expect(@item.errors.full_messages).to include("商品金額は¥1〜9,999,999に設定してください")
      end
      it "priceが0" do
        @item.price = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("商品金額は¥1〜9,999,999に設定してください")
      end
      it "priceが9999999より大きい" do
        @item.price = 10000000000
        @item.valid?
        expect(@item.errors.full_messages).to include("商品金額は¥1〜9,999,999に設定してください")
      end
    end
  end
end
