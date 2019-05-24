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
        puts ''
        puts ''
        puts ''
        puts ''
        puts "Converting task #{task[:content]} index #{task[:category_index]} to #{index}"
        task_hash[task[:id]] = {category_index: index}
      end

      Task.update(task_hash.keys, task_hash.values)
    end
  end

end
