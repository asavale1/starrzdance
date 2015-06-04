class AddWorkshopToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :workshop, :boolean
  end
end
