class Photo < ActiveRecord::Base
	has_attached_file 	:image, 
						:styles => 	{ 
							:large => "500x500",
							:medium => "300x300>", 
							:thumb => "100x100>" 
						}

	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	validates_attachment_presence(:image)
	
end