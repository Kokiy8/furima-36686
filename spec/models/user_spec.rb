require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "すべての項目が入力されていれば登録できる" do
      expect(@user).to be_valid
      end
    end
    context "新規登録できないとき" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスを入力してください"
      end
      it "既に登録されているemailだと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "メールアドレスはすでに存在します"
      end
      it "emailは@がないと登録できない" do
        @user.email = 'test.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages). to include "メールアドレスは不正な値です"
      end
      it "passwordが抜けていると登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it "passwordは６文字以上でないと登録できない" do
        @user.password = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは6文字以上で入力してください"
      end
      it "passwordが半角数字のみの場合は登録できない" do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end
      it "passwordが全角文字を含む場合は登録できない" do
        @user.password = 'ｔest12'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end
      it "passwordと確認用のpasswordは一致していないと登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "確認用のパスワードとパスワードの入力が一致しません"
      end
      it "お名前(全角)の苗字が空だとと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字を入力してください"
      end
      it "お名前(全角)の名前が空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名前を入力してください"
      end
      it "お名前(全角)の苗字はひらがな・カタカナ・漢字以外だと登録できない" do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字は不正な値です"
      end
      it "お名前(全角)の名前はひらがな・カタカナ・漢字以外だと登録できない" do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前は不正な値です"
      end
      it "お名前カナ(全角)の苗字が空だと登録できない" do
        @user.ruby_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字(カナ)を入力してください"
      end
      it "お名前カナ(全角)の名前が空だと登録できない" do
        @user.ruby_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名前(カナ)を入力してください"
      end
      it "お名前カナ(全角)の苗字はカタカナ以外だと登録できない" do
        @user.ruby_last_name = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字(カナ)は不正な値です"
      end
      it "お名前カナ(全角)の名前はカタカナ以外だと登録できない" do
        @user.ruby_first_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前(カナ)は不正な値です"
      end
      it "生年月日が空だと登録できない" do
        @user.dob = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "生年月日を入力してください"
      end
    end
  end
end
