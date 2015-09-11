class ChangePhoneToText < ActiveRecord::Migration
  def change
	  	change_table :students do |t|
	      t.change :phone, :text
	    end
	end
end
