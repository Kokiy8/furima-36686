FactoryBot.define do
  factory :address do
    post_code        { '123-4567' }
    prefecture_id    { '2' }
    municipalities   { 'test' }
    address          { 'test' }
    building_name    { '' }
    telephone_number { 12_345_678_900 }
    association :record, factory: :record
  end
end
