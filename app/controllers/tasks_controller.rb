class TasksController < ApplicationController
  def index
    render json: Task.all
  end

  def batch_create
    new_tasks = strong_batch_params
    new_tasks.each do |new_task|
      Task.create(content: new_task)
    end
    render json: Task.all
  end

  # def create
  # end
  #
  def update
    task = Task.find(params[:id])
    task.update(strong_params)
    render json: Task.all
  end

  def destroy
    task = Task.find(params[:id])
    task.delete
  end

  private

  def strong_batch_params
    params.require(:new_tasks)
  end

  def strong_params
    params.require(:task).permit(:id, :completed)
  end
end
