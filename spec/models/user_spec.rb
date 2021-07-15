require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "全てのカラムに値が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが「半角英数混合で６文字以上」であれば登録できる" do
        @user.password = Faker::Lorem.characters(number: 8, min_alpha: 1, min_numeric: 1)
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it "first_nameが全角であれば登録できる" do
        @user.first_name = "あア阿"
         expect(@user).to be_valid
      end
      it "last_nameが全角であれば登録できる" do
        @user.last_name = "あア阿"
         expect(@user).to be_valid
      end
      it "f_kanaが全角カナであれば登録できる" do
        @user.f_kana = "アアア"
        expect(@user).to be_valid
      end
      it "l_kanaが全角カナであれば登録できる" do
        @user.l_kana = "アアア"
        expect(@user).to be_valid
      end
    end
    context "新規登録できないとき" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailがなければ登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが重複していると登録できない" do
        another_user = FactoryBot.create(:user)
        @user.email = another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が含まれていないと登録できない" do
        @user.email = @user.email.delete("@")
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが半角英数字混合でないと登録できない" do
        @user.password = Faker::Alphanumeric.alpha(number: 10)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordに値が入っていても、password_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが一致していないと登録できない" do
        @user.password_confirmation = Faker::Lorem.characters(number: 10, min_alpha: 1, min_numeric: 1)
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが半角だと登録できない" do
        @user.last_name = "Aaｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが半角だと登録できない" do
        @user.first_name = "Aaｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "l_kanaが空だと登録できない" do
        @user.l_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("L kana can't be blank")
      end
      it "l_kanaが全角カタカナでなければ登録できない" do
        @user.l_kana = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("L kana is invalid")
      end
      it "f_kanaが空だと登録できない" do
        @user.f_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("F kana can't be blank")
      end
      it "f_kanaが全角カタカナでなければ登録できない" do
        @user.f_kana = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("F kana is invalid")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
