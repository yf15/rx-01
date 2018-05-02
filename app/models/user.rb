class User < ApplicationRecord
  before_save {self.email = email.downcase }
  before_save {self.account = account.downcase }
  before_save {self.nickname = nickname.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :account, presence: true, length:{maximum:50},uniqueness:true
  validates :email, presence: true, length:{maximum:255},format: {with: VALID_EMAIL_REGEX},uniqueness:true
  validates :nickname, presence: true, length:{maximum:50},uniqueness: true


  has_secure_password
    validates:password, presence:true, length: {minimum: 6}
end
