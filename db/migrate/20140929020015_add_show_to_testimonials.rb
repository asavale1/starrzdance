class AddShowToTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :show, :boolean
  end
end
