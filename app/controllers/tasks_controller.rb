class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_tasks, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = current_user.tasks.all.page(params[:page]).per(10)
  end

  def show
  end

  def create 
    @task = current_user.tasks.build(task_params)
     
      if @task.save
        flash[:success] = 'Taskが新規作成されました。'
        redirect_to root_url
      else
        flash.now[:danger] = 'Taskの新規作成に失敗しました。'
        render 'toppages/index'
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
    @task = current_user.tasks.find_by(id: params[:id])
    if (@task == nil )
      redirect_to root_url
    end
  end
  
  
  def task_params
    params.require(:task).permit(:content, :status, :user)
  end
end
