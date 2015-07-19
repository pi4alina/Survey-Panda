class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end
  
  def new
    @survey = Survey.new
  end
  
  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to new_survey_question_path(@survey)
    else
      flash.now[:error] = @survey.errors.full_messages
    end
  end 
  
  def show
    @survey = Survey.find_by(id: params[:id])
  end

	def destroy
		Survey.find_by(id: params[:id]).destroy
		redirect_to :root
	end

	def result
		@survey = Survey.find_by(id: params[:id])
	end
  
  private
  
  def survey_params
    params.require(:survey).permit(:title, :description).merge(author_id: session[:user_id])
  end
end
