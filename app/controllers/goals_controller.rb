class GoalsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @goal = @user.goals.create(params[:goal].permit(:name))
    redirect_to user_path(@user)
  end


  def edit
    @goal = User.find(params[:user_id]).goals.find(params[:id])
  end


  def update
    @goal = User.find(params[:user_id]).goals.find(params[:id])

    if @goal.update(params[:goal].permit(:name))
      redirect_to user_goals_path
    else
      render 'edit'
    end
  end

  def destroy
    @goal = User.find(params[:user_id]).goals.find(params[:id])
    @goal.destroy

    redirect_to users_path
  end

  def show
    @goal = User.find(params[:user_id]).goals.find(params[:id])
  end

  def index
    @user = User.find(params[:user_id])
    @goals = User.find(params[:user_id]).goals.all
  end
end
