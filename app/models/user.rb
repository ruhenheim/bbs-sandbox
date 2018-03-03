class User < ApplicationRecord
  has_many :posts

  validates :email, presence: true, length: { maximum: 255 },
    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_secure_password

  private
  def downcase_email
    self.email = email.try(:downcase)
  end
end
