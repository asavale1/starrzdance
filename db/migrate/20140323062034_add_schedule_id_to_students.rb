class AddScheduleIdToStudents < ActiveRecord::Migration
  def change
  	add_column :students, :schedule_id, :integer
  end
end
