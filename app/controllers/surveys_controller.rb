class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end
  
  def new
    @user = User.find_by(id: session[:user_id])
    @survey = Survey.new
    @survey_id = session[:survey_id] ||= 1
  end
  
  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      session[:survey_id] = @survey.id
      request.xhr? ? render(partial: 'survey', object: @survey, layout: false) : redirect_to(@survey)
    else
      # flash.now[:error] = @survey.errors.full_messages
      flash[:error] = "Title required"
      redirect_to new_survey_path
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
