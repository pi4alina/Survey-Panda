class QuestionsController < ApplicationController
  def new
    @survey = Survey.find_by(id: params[:survey_id])
    @question = Question.new
  end

  def create
    question = Question.new(question_params,)
    possible_vals_string = Question.possible_values_to_string(params[:possible_values])
    question.possible_values = possible_vals_string
    question.survey_id = params[:survey_id]
    if question.save
      redirect_to new_survey_question_path
    else
    end
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
