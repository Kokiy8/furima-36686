require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    @record_address = FactoryBot.build(:record_address)
  end

  describe  '商品の購入' do
    context '商品を購入できる時' do
      it '全ての項目が入力されていれば購入できる' do
        expect(@record_address).to be_valid
      end
      it '建物名が空でも購入できる' do
        @record_address.building_name = ''
        expect(@record_address).to be_valid
      end
    end
    context '商品を購入できないとき' do
      it '郵便番号が空だと購入できない' do
        @record_address.post_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Post codeを入力してください"
      end
      it '郵便番号に-が含まれていないと購入できない' do
        @record_address.post_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Post codeは不正な値です"
      end
      it '郵便番号に全角文字が含まれていると購入できない' do
        @record_address.post_code = 'ｔ23－4567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Post codeは不正な値です"
      end
      it '郵便番号に全角数字が含まれていると購入できない' do
        @record_address.post_code = '１２３-4567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Post codeは不正な値です"
      end
      it '郵便番号は-の前3つ、後ろに4つの構成でないと登録できない' do
        @record_address.post_code = '1234-567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Post codeは不正な値です"
      end
      it '都道府県を選択していないと購入できない' do
        @record_address.prefecture_id = '1'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Prefectureは1以外の値にしてください"
      end
      it '市区町村が空だと購入できない' do
        @record_address.municipalities = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Municipalitiesを入力してください"
      end
      it '番地が空だと購入できない' do
        @record_address.address = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Addressを入力してください"
      end
      it '電話番号が空だと購入できない' do
        @record_address.telephone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Telephone numberを入力してください"
      end
      it '電話番号に全角文字が含まれていると購入できない' do
        @record_address.telephone_number = 'ｔ1234567890'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Telephone numberは不正な値です"
      end
      it '電話番号が9桁以下だと購入できない' do
        @record_address.telephone_number = '123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Telephone numberは不正な値です"
      end
      it '電話番号が12桁以上だと購入できない' do
        @record_address.telephone_number = '123456789012'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Telephone numberは不正な値です"
      end
      it '電話番号に全角数字が含まれていると購入できない' do
        @record_address.telephone_number = '１234567890'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Telephone numberは不正な値です"
      end
      it "トークンが空では購入できない" do
        @record_address.token = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include "Tokenを入力してください"
      end
    end
  end
end
