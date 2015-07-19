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
        redirect_to root_path, layout: false
      end
    else
      byebug
    end
  end

  private

  def response_params
    params.require(:response).permit(:content)
  end

end
