module StaticPagesHelper
	def clean_phone_input(input)
		input = input.gsub('-', '')
		input = input.gsub('(', '')
		input = input.gsub(')','')

		return input
	end

end
