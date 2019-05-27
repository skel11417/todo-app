class TasksController < ApplicationController
  def index
    render json: Task.sorted_tasks
  end

  def batch_create
    new_tasks = strong_batch_params
    new_tasks.each do |new_task|
      t = Task.create(content: new_task)
    end
    render json: Task.sorted_tasks
  end

  # def create
  # end
  #

  def update_cat_indexes
    Task.update_cat_indexes(params[:category_data])
    render json: Task.sorted_tasks
  end

  def update_time_indexes
    Task.update_time_indexes(params[:timeframe_data])
    render json: Task.sorted_tasks
  end

  def update
    task = Task.find(params[:id])
    task.update(strong_params)
    render json: Task.sorted_tasks
  end

  def destroy
    task = Task.find(params[:id])
    task.delete
    render json: Task.sorted_tasks
  end

  private
  def strong_batch_params
    params.require(:new_tasks)
  end

  def strong_params
    params.require(:task).permit(:id, :completed, :date_completed, :scheduled_date, :category, :category_index)
  end
end
