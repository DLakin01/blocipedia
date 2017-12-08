FactoryBot.define do
  factory :wiki do
    title RandomData.random_sentence
    body RandomData.random_paragraph
    user RandomData.random_name
    private false
  end
end
