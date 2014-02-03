class DaysController < ApplicationController

  def create
    @week = Week.find(params[:week_id])
    @day = @week.days.create(params[:day].permit(:name))
    redirect_to user_weeks_path(@week)
  end

  def index
    @days = Week.find(params[:week_id]).days
  end


  def destroy
    @day = Week.find(params[:week_id]).days.find(params[:id])
    @day.destroy

    redirect_to users_path
  end


  def show
    @day = Week.find(params[:week_id]).days.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @day }
    end
  end
end
