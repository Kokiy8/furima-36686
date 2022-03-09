FactoryBot.define do
  factory :record_address do
    post_code        { '123-4567' }
    prefecture_id    { '2' }
    municipalities   { 'test' }
    address          { 'test' }
    building_name    { 'test' }
    telephone_number { '12345678900' }
    token { 'tok_abcdefghijk00000000000000000' }
    association :item
    association :user
  end
end
