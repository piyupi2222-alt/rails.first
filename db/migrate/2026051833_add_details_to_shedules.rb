class AddDetailsToSchedules < ActiveRecord::Migration[7.2]
  def change
    add_column :schedules, :schedule_memo, :string
  end
end
