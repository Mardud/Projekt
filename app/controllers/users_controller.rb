class UsersController < ApplicationController
  respond_to :json
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.create(user_params)

    head :ok
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.json { render json: @user }
      format.html # show.html.erb
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(params[:user].permit(:name, :surname, :email, :password))
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end


  private
    def user_params
      params.permit(:name, :surname, :email, :password)
    end
end
