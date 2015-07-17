class User < ActiveRecord::Base
  has_secure_password
  has_many :surveys, foreign_key: "author_id"
  has_many :taken_surveys, foreign_key: "taker_id"
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: {in: 5..16}
end
