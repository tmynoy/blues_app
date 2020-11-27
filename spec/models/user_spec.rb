require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      expect(@user).to be_valid
    end
    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "nicknameが6文字以上では登録できないこと" do
      @user.nickname = "あああああああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 6 characters)")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが6文字以上であれば登録できること" do
      @user.password = "11111111"
      @user.password_confirmation = "11111111"
      expect(@user).to be_valid
    end
    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "11111"
      @user.password_confirmation = "11111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "1111111"
      @user.password_confirmation = "2222222"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
  end

end
