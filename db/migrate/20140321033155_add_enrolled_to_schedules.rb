class AddEnrolledToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :enrolled, :integer
  end
end
