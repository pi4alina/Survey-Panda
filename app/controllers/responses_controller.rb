class ResponsesController < ApplicationController

  def new
    @response = Response.new
    @survey = Survey.find_by(id: params[:id])
    @question_choices = ["cat","dog","panda","elephant","pineapple"] #hardcoded example
    # @questions_choices = @survey.questions.possible_values.split
  end

  def create
    response = Response.new(response_params)
    response.question_id = params[:response][:question_id]
    response.save!
    redirect_to :back
  end

  private

  def response_params
    params.require(:response).permit(:content)
  end

end
