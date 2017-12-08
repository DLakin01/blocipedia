require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:wiki) { create(:wiki) }

  it { should belong_to :user }

  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_least(5) }

  it { should validate_presence_of(:body) }
  it { should validate_length_of(:body).is_at_least(15) }
end
