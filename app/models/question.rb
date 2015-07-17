class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :responses
  validates :name, presence: true

  def possible_values_to_string(value_array)
    value_array.join(",")
  end

  def possible_values_to_array(value_string)
    value_string.split(",").map(&:strip)
  end
end
