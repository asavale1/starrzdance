class AddHomeToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :home, :boolean
  end
end
