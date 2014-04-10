class Video < ActiveRecord::Base
	has_attached_file :clip, :styles => {
			:mp4 => { :geometry => "640x480", :format => 'mp4'},
			:webm => { :geometry => "640x480", :format => 'webm'},
			:thumb => {:geometry => "100x100#", :format => 'jpg', :time => 10},
			:large => {:geometry => "400x400#", :format => "jpg", :time => 10}
		}, :processors => [:ffmpeg, :qtfaststart]
	do_not_validate_attachment_file_type(:clip)
	validates_attachment_presence(:clip)
end
