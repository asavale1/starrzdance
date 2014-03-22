class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :student_name
      t.string :parent_name
      t.string :email
      t.integer :phone
      t.string :city
      t.string :state
      t.integer :zipcode

      t.timestamps
    end
  end
end
