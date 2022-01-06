FactoryBot.define do
  factory :user do
    nickname               { 'test' }
    email                  { 'test@gmail.com' }
    password               { 'test12' }
    password_confirmation  { password }
    last_name              { '山田' }
    first_name             { '太郎' }
    ruby_last_name         { 'ヤマダ' }
    ruby_first_name        { 'タロウ' }
    dob                    { '1999-01-01' }
  end
end