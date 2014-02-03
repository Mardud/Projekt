class WeeksController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @week = @user.weeks.create(params[:week].permit(:date))
    redirect_to user_path(@user)
  end

  def edit
    @week = User.find(params[:user_id]).weeks.find(params[:id])
  end


  def update
    @week = User.find(params[:user_id]).weeks.find(params[:id])

    if @week.update(params[:week].permit(:date))
      redirect_to user_weeks_path
    else
      render 'edit'
    end
  end

  def destroy
    @week = User.find(params[:user_id]).weeks.find(params[:id])
    @week.destroy

    redirect_to users_path
  end

  def index
    @user = User.find(params[:user_id])
    @weeks = User.find(params[:user_id]).weeks
  end

  def show
    @week = User.find(params[:user_id]).weeks.find(params[:id])
  end
end
