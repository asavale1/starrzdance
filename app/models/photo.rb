class Photo < ActiveRecord::Base
	has_attached_file 	:image, 
						:styles => 	{ 
							:large => "500x",
							:medium => "300x>", 
							:thumb => "100x>" 
						}

	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	validates_attachment_presence(:image)
	
end
