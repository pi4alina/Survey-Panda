class ResponsesController < ApplicationController

  def new
  end

  def create
    response = Response.new(response_params)
    response.question_id = params[:question_id]
    if response.save 
      next_question = response.question.next
      if next_question
        redirect_to survey_question_path(next_question.survey, next_question)
      else
				question = Question.find_by(id: params[:question_id])
				current_user.taken_surveys.create(survey_id: question.survey_id, taker_id: current_user.id)	
        redirect_to surveys_path, layout: false
      end
    end
  end

  private

  def response_params
    params.require(:response).permit(:content)
  end

end
