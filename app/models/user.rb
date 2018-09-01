class User < ApplicationRecord
  belongs_to :rol
  # encrypt password
  has_secure_password

  # Validations
  validates_presence_of :nickname, :email, :password_digest
end
