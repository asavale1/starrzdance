class CreateStatics < ActiveRecord::Migration
  def change
    create_table :statics do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
