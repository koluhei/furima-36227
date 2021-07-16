require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end
  
  describe "商品出品" do
    context "商品出品できるとき" do
      it "全てのカラムに値が入っていれば出品できる" do
        expect(@item).to be_valid
      end
      it "値段が300円以上なら出品できる" do
        @item.price = 300
        expect(@item).to be_valid
      end
      it "値段が9,999,999円以下なら出品できる" do
        @item.price = 9999999
        expect(@item).to be_valid
      end
      it "category_idが1以外なら出品できる" do
        @item.category_id = Faker::Number.between(from: 2, to: 11)
        expect(@item).to be_valid
      end
      it "status_idが1以外なら出品できる" do
        @item.status_id = Faker::Number.between(from: 2, to: 7)
        expect(@item).to be_valid
      end
      it "delivery_charge_idが1以外なら出品できる" do
        @item.delivery_charge_id = Faker::Number.between(from: 2, to: 3)
        expect(@item).to be_valid
      end
      it "prefecture_idが1以外なら出品できる" do
        @item.prefecture_id = Faker::Number.between(from: 2, to: 48)
        expect(@item).to be_valid
      end
      it "days_to_ship_idが1以外なら出品できる" do
        @item.days_to_ship_id = Faker::Number.between(from: 2, to: 4)
        expect(@item).to be_valid
      end
    end
    context "商品出品できないとき" do
      it "商品名がないと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank") 
      end
      it "説明がないと出品できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank") 
      end
      it "価格がないと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank") 
      end
      it "category_idが空だと出品できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank") 
      end
      it "status_idが空だと出品できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank") 
      end
      it "delivery_charge_idが空だと出品できない" do
        @item.delivery_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank") 
      end
      it "prefecture_idが空だと出品できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank") 
      end
      it "days_to_ship_idが空だと出品できない" do
        @item.days_to_ship_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank") 
      end
      it "画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "ユーザーが紐づいていないと出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it "価格が300円未満だと出品できない" do
        @item.price = Faker::Number.between(from: 0, to: 299)
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が9,999,999円より高いと出品できない" do
        @item.price = Faker::Number.number(digits: 8)
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "カテゴリーが選択されていないと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が選択されていないと出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "配送手数料の情報が選択されていないと出品できない" do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it "発送元の地域が選択されていないと出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送までの日数が選択されていないと出品できない" do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
    end
  end
end
