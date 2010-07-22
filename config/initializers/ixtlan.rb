module Ixtlan
  module Models
    # overwrite configuration class
    # CONFIGURATION = "::MyConfiguration"
    # set this to nil to switch off Audit logs into the database
    # AUDIT = nil
  end
end

# rails related libraries from ixtlan
require 'ixtlan/rails'

# auto require to load needed libraries . . .
require 'datamapper4rails'
require 'ixtlan/logger_config' if ENV['RAILS_ENV']

require 'ixtlan/session'
ActionController::Base.session_store = :datamapper_store

if defined? JRUBY_VERSION || ENV['RAILS_ENV'] == 'development'
  # jruby uses soft-references for the cache so cleanup is no problem.
  ActionController::Base.session = {
    :cache         => true,
    :session_class => Ixtlan::SessionWithCache
  }
else
  # cleanup can be a problem with MRI => no cache
  ActionController::Base.session = {
    :cache         => false,
    :session_class => Ixtlan::Session
  }
end

# load the guard config files from RAILS_ROOT/app/guards
Ixtlan::Guard.load(Slf4r::LoggerFacade.new(Ixtlan::Guard)) if ENV['RAILS_ENV']
