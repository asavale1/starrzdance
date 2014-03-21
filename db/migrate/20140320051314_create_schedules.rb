class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :group
      t.string :session
      t.string :time
      t.string :location
      t.string :instructor
      t.decimal :fee
      t.integer :capacity

      t.timestamps
    end
  end
end
