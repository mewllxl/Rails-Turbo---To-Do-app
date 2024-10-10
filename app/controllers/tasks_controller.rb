class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def incomplete
    @incomplete_tasks = Task.where(status: 0)
    @task = Task.new
    render :index
  end

  def complete_tasks
    @complete_tasks = Task.where(status: 1)
    @task = Task.new
    render :index
  end

  def create
    @task = Task.new(task_params)
    @task.status = 0 # ตั้งค่าเริ่มต้นให้เป็น incomplete
    if @task.save
      redirect_to incomplete_tasks_path # เปลี่ยนไปหน้า incomplete ทันที
    else
      render :index
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.update(status: 1)
    redirect_to incomplete_tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy 
    redirect_to request.referer || tasks_path 
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
