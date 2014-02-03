class TasksController < ApplicationController

  def create
    @day = Day.find(params[:day_id])
    @task = @day.tasks.create(params[:task].permit(:done, :name))
    redirect_to users_path
  end

  def index
    @tasks = Day.find(params[:day_id]).tasks
  end

  def edit
    @task = Day.find(params[:day_id]).tasks.find(params[:id])
  end


  def update
    @task = Day.find(params[:day_id]).tasks.find(params[:id])

    if @task.update(params[:task].permit(:done, :name))
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @task = Day.find(params[:day_id]).tasks.find(params[:id])
    @task.destroy

    redirect_to users_path
  end

  def show
    @task = Day.find(params[:day_id]).tasks.find(params[:id])

    respond_to do |format|
      format.json { render json: @task }
      format.html # show.html.erb
    end
  end
end
