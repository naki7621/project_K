FactoryBot.define do
  factory :user do
    name                  {'test'}
    email                 {'test@test'}
    password              {'A123456789'}
    password_confirmation {password}
  end
end