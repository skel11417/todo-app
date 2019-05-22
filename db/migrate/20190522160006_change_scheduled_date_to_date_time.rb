class ChangeScheduledDateToDateTime < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :scheduled_date, :datetime
  end
end
