class ChangeFeeFormatInSchedule < ActiveRecord::Migration
  def self.up
   change_column :schedules, :fee, :string
  end

  def self.down
   change_column :schedules, :fee, :decimal
  end
end
