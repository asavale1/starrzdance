# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
	token_file = Rails.root.join('secret')
	if(File.exists?(token_file))
		File.read(token_file).chomp
	else
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

Starrzdance::Application.config.secret_key_base = secure_token
#'9c6fb56ab62eb9c9a6aa79e5c8630c0566f5ad88dcf551a7c71c5feb14ba999465b283bd37cd5cbf75e914d931b268e41e169db86b1b406a0cf819c75889ab3c'
