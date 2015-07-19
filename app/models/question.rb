class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :responses
  validates :name, presence: true

  def self.possible_values_to_string(value_array)
    value_array.join(",")
  end

  def possible_values_to_array
    self.possible_values.split(",").map(&:strip)
  end
  
  def next  
    survey.questions.where("id > ?", id).first
  end

	def percentage(choice)
		(self.responses.where(content: choice).count / self.responses.count * 100).to_s + "%"
	end
end
