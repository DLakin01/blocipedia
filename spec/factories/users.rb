FactoryBot.define do
  factory :user do
    name RandomData.random_name
    email RandomData.random_email
    password RandomData.random_sentence
  end
end
