FactoryBot.define do
  factory :item do
    item_name          { 'test' }
    description        { 'test' }
    category_id        { '2' }
    condition_id       { '2' }
    delivery_charge_id { '2' }
    days_to_id         { '2' }
    prefectures_id     { '2' }
    price              { '300' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'テスト画像ファイル')
    end
  end
end
