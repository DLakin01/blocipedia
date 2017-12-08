require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it { should have_many(:wikis) }

  # Validations for name
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(1) }

  # Validations for email
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:email).is_at_least(6) }
  it { should allow_value("dlakin02@gmail.com").for(:email) }

  # Validations for password
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(8) }

  describe "attributes" do
    it "should have name, email, and password attributes" do
      expect(user).to have_attributes(name: user.name, email: user.email, password: user.password)
    end
  end
end
