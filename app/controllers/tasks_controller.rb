class TasksController < ApplicationController
  def index
    render json: Task.all
  end

  # def batch_create

# end

  # def create
  # end
  #
  # def update
  # end
  #
  # def destroy
  # end
end
