class ChangePaidFormatInStudentsTable < ActiveRecord::Migration
  def up
  	change_column :students, :paid, :string
  end

  def down
  	change_column :students, :paid, :boolean
  end
end
