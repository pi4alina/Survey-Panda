class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
