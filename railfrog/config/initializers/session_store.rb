# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_railfrog_session',
  :secret      => 'a2d411eee5fb3169f3c24d97e6571dcf4fc68014c0f8eb4c7cde4da4f9679085442fd5cc69ac6aec04dda562f68d155e06c6f044e1ca8a6163d98ce255319ea6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
