class CreateSchedules < ActiveRecord::Migration[7.2]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :startday
      t.date :finishday
      t.string :allday
      t.datetime :update
      t.timestamps
    end
  end
end
