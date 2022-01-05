require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空だと登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "既に登録されているemailだと登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
    it "passwordが抜けていると登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "passwordは６文字以上でないと登録できない" do
      @user.password = 'test1'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it "passwordは半角英数字混合出ないと登録できない" do
      @user.password = 'testtest'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it "passwordと確認用のpasswordは一致していないと登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "お名前(全角)の苗字が空だとと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it "お名前(全角)の名前が空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it "お名前(全角)の苗字はひらがな・カタカナ・漢字以外だと登録できない" do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end
    it "お名前(全角)の名前はひらがな・カタカナ・漢字以外だと登録できない" do
      @user.first_name = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it "お名前カナ(全角)の苗字が空だと登録できない" do
      @user.ruby_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Ruby last name can't be blank"
    end
    it "お名前カナ(全角)の名前が空だと登録できない" do
      @user.ruby_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Ruby first name can't be blank"
    end
    it "お名前カナ(全角)の苗字はカタカナ以外だと登録できない" do
      @user.ruby_last_name = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include "Ruby last name is invalid"
    end
    it "お名前カナ(全角)の名前はカタカナ以外だと登録できない" do
      @user.ruby_first_name = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include "Ruby first name is invalid"
    end
    it "生年月日が空だと登録できない" do
      @user.dob = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Dob can't be blank"
    end
  end
end
