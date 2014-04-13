class Video < ActiveRecord::Base
	has_attached_file :clip, :styles => {
			:flv => { :geometry => "640x480", :format => 'flv'},
			:thumb => {:geometry => "100x100#", :format => 'jpg', :time => 10},
			:large => {:geometry => "400x400#", :format => "jpg", :time => 10}
		}, :processors => [:ffmpeg]
	do_not_validate_attachment_file_type(:clip)
	#validates_attachment_presence(:clip)
	validate :only_upload_or_url

	private
		def only_upload_or_url
			if clip.present? and url.present?
				errors.add(:clip, "Can not have bot clip and url")
				errors.add(:url, "Can not have bot clip and url")
				puts "\n\nIN HERE\n\n"
				return false
			elsif !clip.present? and !url.present?
				errors.add(:clip, "Clip and url can not be empty")
				errors.add(:url, "Clip and url can not be empty")
				puts "\n\nIN THERE\n\n"
				return false
			else
				return true
			end
		end
end
