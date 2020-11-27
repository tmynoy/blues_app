FactoryBot.define do
  factory :user do
    nickname              {"山田"}
    email                 {"123@123"}
    password              {"111111"}
    password_confirmation {password}
  end
end