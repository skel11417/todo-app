class Task < ApplicationRecord

  def self.update_cat_indexes(category_data)
    # change category of moved task
    updated_task = category_data["updatedTask"]
    Task.update(updated_task[:id], category: updated_task[:category])

    # update indexes of all tasks in a category
    updated_categories = category_data["updatedCategories"]
    updated_categories.each_pair do |key, tasks|
      task_hash = {}
      tasks.each_with_index do |task, index|
        task_hash[task[:id]] = {category_index: index}
      end
      Task.update(task_hash.keys, task_hash.values)
    end
  end

  def self.update_time_indexes(timeframe_data)
    # change category of moved task
    updated_task = timeframe_data["updatedTask"]
    Task.update(updated_task[:id], scheduled_date: updated_task[:scheduled_date])

    # update indexes of all tasks in a category
    updated_timeframes = timeframe_data["updatedTimeframes"]
    updated_timeframes.each_pair do |key, tasks|
      task_hash = {}
      tasks.each_with_index do |task, index|
        task_hash[task[:id]] = {timeframe_index: index}
      end
      # puts task_hash
      Task.update(task_hash.keys, task_hash.values)
    end
  end

  def self.sorted_tasks
    Task.all.sort_by {|task| task.category_index}
  end
end
