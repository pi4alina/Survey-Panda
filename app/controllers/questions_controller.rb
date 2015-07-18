class QuestionsController < ApplicationController

  before_action :require_login

  def new
    @survey = Survey.find_by(id: params[:survey_id])
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    question.survey_id = params[:survey_id]
    update_possible_values(question, params[:possible_values])
    if question.save
      flash[:success] = "Your question '#{question.name}' was successfully added!"
    else
      flash[:error] = "There was an error adding your question"
    end
    redirect_to new_survey_question_path
  end

  def edit
    @question = Question.find_by(id: params[:id])
    @survey = @question.survey
    @possible_values = @question.possible_values_to_array
  end

  def update
    question = Question.find_by(id: params[:id])
    question.update_attributes(question_params)
    update_possible_values(question, params[:possible_values])

    if question.save
      flash[:success] = "Question updated!"
    else
      flash[:error] = "There was an error editing your question"
    end
      redirect_to survey_question_path(question.survey, question)
  end

  def destroy
    question = Question.find_by(id: params[:id])
    survey = question.survey
    if question.destroy
      flash[:success] = "Question deleted!"
    else 
      flash[:error] = "There was an error deleting your question"
    end
      redirect_to survey_path(survey)
  end

  private
  def question_params
    params.require(:question).permit(:name, :possible_values)
  end

  def update_possible_values(question, vals)
    possible_vals_string = Question.possible_values_to_string(vals)
    question.possible_values = possible_vals_string
  end
end
