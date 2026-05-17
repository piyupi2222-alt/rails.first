class RenameUpdateColumnSchedules < ActiveRecord::Migration[7.2]
  def change
    rename_column :schedules, :update, :updateday
  end
end
