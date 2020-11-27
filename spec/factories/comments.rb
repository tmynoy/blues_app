FactoryBot.define do
  factory :comment do
    content              {"ナイス!"}
    association :user
    association :member
  end
end
