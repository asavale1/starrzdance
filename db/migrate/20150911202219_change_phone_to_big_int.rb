class ChangePhoneToBigInt < ActiveRecord::Migration
  	def change
	  	change_table :students do |t|
	      t.change :phone, :integer, :limit => 10
	    end
	end
end
