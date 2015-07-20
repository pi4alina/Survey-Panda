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
    total_responses = self.responses.count.to_f
    if total_responses > 0
		  total_responses_with_choice = self.responses.where(content: choice).count.to_f / total_responses
    else
      total_responses_with_choice = 0
    end
    (total_responses_with_choice * 100).to_s + "%"
	end
end
