class Wiki < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 5, maximum: 100 }

  validates :body, presence: true, length: { minimum: 15, maximum: 1000 }
end
