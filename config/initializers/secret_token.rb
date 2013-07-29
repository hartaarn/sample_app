# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

#commenting this out to create a dynamically generated secret token instead
#SampleApp::Application.config.secret_key_base = '1d7432453f50c43508b9442accce6564928f9b7becaaf6f2f4aa3a98a38e3b6283136328e8af104a1e8797963c6544a557a4985df04dfdae9b5157a6b3e4ddfd'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp::Application.config.secret_key_base = secure_token