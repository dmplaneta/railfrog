# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_engines_test_session',
  :secret      => '02ec38ccb9434c47f32c7bdfec129f2977c58644f77ad7c223b5aa3ed81c4bfd07989e8c3baff7c8e6630aa32c79776885212875f3e51ef261ef8553a3940b6b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
