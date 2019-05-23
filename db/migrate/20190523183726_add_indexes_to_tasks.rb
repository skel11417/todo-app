class AddIndexesToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :cat_index, :integer
    add_column :tasks, :time_index, :integer
  end
end
