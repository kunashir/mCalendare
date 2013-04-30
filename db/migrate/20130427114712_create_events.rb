class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.integer :day_of_mounth
      t.integer :day_of_week
      t.integer :day1
      t.integer :day2
      t.integer :day3
      t.integer :day4
      t.integer :day5
      t.integer :day6
      t.integer :day7
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
