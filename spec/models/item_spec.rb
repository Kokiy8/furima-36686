require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品を出品できるとき' do
      it 'すべての項目が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を出品できないとき' do
      it '商品名が空だと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '商品名を入力してください'
      end
      it '商品の説明が空だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の説明を入力してください'
      end
      it 'カテゴリーの一覧は1以外を選択していないと出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'カテゴリーは1以外の値にしてください'
      end
      it '商品の状態の一覧は１以外を選択していないと出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の状態は1以外の値にしてください'
      end
      it '配送料の負担の一覧は１以外を選択していないと出品できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '配送料の負担は1以外の値にしてください'
      end
      it '発送元の地域の一覧は１以外を選択していないと出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '発送元の地域は1以外の値にしてください'
      end
      it '発送までの日数の一覧は１以外を選択していないと出品できない' do
        @item.days_to_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '発送までの日数は1以外の値にしてください'
      end
      it '販売価格が空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格を入力してください'
      end
      it '販売価格が300未満だと出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は一覧にありません'
      end
      it '販売価格が10，000，000以上だと出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は一覧にありません'
      end
      it '販売価格が全角数字だと出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は一覧にありません'
      end
      it '販売価格が文字を含む場合は出品できない' do
        @item.price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は一覧にありません'
      end
      it '商品画像が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include '商品画像を入力してください'
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'ユーザーを入力してください'
      end
    end
  end
end
