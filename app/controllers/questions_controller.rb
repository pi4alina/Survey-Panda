class QuestionsController < ApplicationController
  def new
    @survey = Survey.find_by(id: params[:survey_id])
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def question_params
    params.require(:question).permit(:name, :possible_values)
  end
end
