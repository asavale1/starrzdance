class AddPaidToStudents < ActiveRecord::Migration
  def change
    add_column :students, :paid, :boolean
  end
end
