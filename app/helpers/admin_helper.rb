module AdminHelper
	def check_nil(value)
		return (value.strip == '')? nil : value.strip
	end

	def parse_url(value)
		unless value.nil?
			if  value.include?"embed"
				return value
			else
				parts = value.split("/")
				key = parts[3].split("=")[1]
				parts[3] = "embed/#{key}"
				return parts.join("/")
			end
		else
			return nil
		end
	end

	def get_thumbnail(value)
		unless value.nil?
			parts = value.split("/")
			key = parts[3].split("=")[1]
			return "http://img.youtube.com/vi/#{key}/0.jpg"
		else
			return nil
		end
	end

end
