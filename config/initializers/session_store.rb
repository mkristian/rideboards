# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rideboards_session',
  :secret      => '5f15a6d2f30ad86e424779981074e84f844481e2e0d086868dad0e6713c3266f02e425f1d272e705c15621b5c08d5492f20e7bb1622e6e0beed5e4abd270e61d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
