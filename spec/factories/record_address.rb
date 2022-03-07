FactoryBot.define do
  factory :record_address do
    post_code        { '123-4567' }
    prefecture_id    { '2' }
    municipalities   { 'test' }
    address          { 'test' }
    building_name    { 'test' }
    telephone_number {12345678900}
    user_id { '1' }
    item_id { '1' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end