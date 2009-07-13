# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_railfrog_with_engines_session',
  :secret      => 'f9fd68735dee08fc6d26c642c587deb4f19295dfa0f700f01877af884576f5214f5a8d427f4953ceb889b6df0e1d4548937de5c747aa242ab36f5ac84dcc3bcc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
