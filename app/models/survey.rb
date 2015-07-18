class Survey < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  belongs_to :author, class_name: "User"
  has_many :taken_surveys
  has_many :takers, through: :taken_surveys, class_name: "User"
  validates :title, presence: true
end
