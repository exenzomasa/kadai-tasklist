class TasksController < ApplicationController
  before_action :set_tasks, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
  end

  def create 
    @task = Task.new(task_params)
     
      if @task.save
        flash[:success] = 'Taskが新規作成されました。'
        redirect_to @task
      else
        flash[:danger] = 'Taskの新規作成に失敗しました。'
        render :new
      end
  end
  
  def new
    @task = Task.new
  end

  def edit
  end

  def update
      if @task.update(task_params)
        flash[:success] = 'Taskが更新されました。'
        redirect_to @task
      else
        flash.now[:danger] = 'Taskの更新に失敗しました。'
        render :edit
      end
  end

  def destroy
    @task.destroy
   
    flash[:success] = 'Taskは削除されました。'
    redirect_to tasks_url
  end
  
  private
  
  def set_tasks
    @task = Task.find(params[:id])
  end
  
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
end
