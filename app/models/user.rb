class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :welcome_email

  # Validations for name
  validates :name, presence: true, length: { minimum: 1, maximum: 100 }

  # Validations for password
  validates :password, presence: true, length: { minimum: 8 }

  # Validations for email
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 6, maximum: 254 }

def avatar_url(size)
  gravatar_id = Digest::MD5::hexdigest(self.email).downcase
  "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?s=#{size}"
end

  private
  def welcome_email
    MyMailer.new_user(self).deliver_now
  end
end
