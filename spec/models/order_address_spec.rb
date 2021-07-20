require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe "商品購入" do
    context "商品購入できるとき" do
      it "全てのカラムに値が存在すれば購入できる" do
        expect(@order_address).to be_valid
      end
      it "携帯番号は10桁でも購入できる" do
        @order_address.phone_number = "0901234567"
        expect(@order_address).to be_valid
      end
      it "建物名はなくても購入できる" do
        @order_address.building = ""
        expect(@order_address).to be_valid
      end
    end

    context "商品購入できないとき" do
      it "郵便番号が空だと購入できない" do
        @order_address.postal_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal number can't be blank")
      end
      it "郵便番号はハイフンがなければ購入できない" do
        @order_address.postal_number = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal number is invalid. Include hyphen(-)")
      end
      it "郵便番号は「3桁ハイフン4桁」でなければ購入できない" do
        @order_address.postal_number = "1234-567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal number is invalid. Include hyphen(-)")
      end
      it "郵便番号は全角では購入できない" do
        @order_address.postal_number = "１２３-４５６７"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal number is invalid. Include hyphen(-)")
      end
      it "郵便番号はアルファベットでは購入できない" do
        @order_address.postal_number = "abc-defg"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal number is invalid. Include hyphen(-)")
      end
      it "都道府県が空だと購入できない" do
        @order_address.prefecture_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "都道府県が選択されていないと購入できない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市区町村が空だと購入できない" do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空だと購入できない" do
        @order_address.address = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空だと購入できない" do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号にハイフンがついていると購入できない" do
        @order_address.phone_number = "090-12345678"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Do not include hyphen(-)")
      end
      it "電話番号が全角だと購入できない" do
        @order_address.phone_number = "０９０１２３４５６７８"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Do not include hyphen(-)")
      end
      it "電話番号が10桁未満だと購入できない" do
        @order_address.phone_number = "090123456"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Do not include hyphen(-)")
      end
      it "電話番号が11桁より多いと購入できない" do
        @order_address.phone_number = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Do not include hyphen(-)")
      end
    end
  end

end
