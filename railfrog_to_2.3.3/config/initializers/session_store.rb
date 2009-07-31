# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_railfrog_to_2.3.3_session',
  :secret      => 'abbf4239e5daf95fab0710d6030037cbbaeca280a402fe0c2fa031c93f22ab6705119d869a95bdae515c8d1fb5c3896217396bdda53835ab1918c8b13ae2bc7b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
