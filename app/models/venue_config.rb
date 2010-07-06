class VenueConfig
  include DataMapper::Resource

  FORMAT_MESSAGE = "must be of the format: http://*.dhamma.org/* or https://*.dhamma.org/*"
  URL_PATTERN = "^https?:\/\/(\w+:\w+@)?([a-z-]+[.])+dhamma.org\/?.*$|^\s*$"

  property :id, Serial

  property :date_format, String, :required => true, :format => /^[^<'&">]*$/, :length => 255, :default => "%Y-%M-%d"
  property :home_url, String, :required => true, :format => /#{URL_PATTERN}/, :length => 255, :message => FORMAT_MESSAGE
  property :schedule_url, String, :required => true, :format => /#{URL_PATTERN}/, :length => 255, :message => FORMAT_MESSAGE
  property :checklist_url, String, :required => false, :format => /#{URL_PATTERN}/, :length => 255, :message => FORMAT_MESSAGE
  property :iframe_url, String, :required => false, :format => /#{URL_PATTERN}/, :length => 255, :message => FORMAT_MESSAGE

  property :venue_id, Integer, :required => true
  property :locale_id, Integer, :required => true
  belongs_to :locale, :required => true
  belongs_to :venue, :required => true

  timestamps :at

  modified_by Ixtlan::Models::USER

  require 'dm-serializer'
  alias :to_x :to_xml_document
  def to_xml_document(opts = {}, doc = nil)
    unless(opts[:methods])
      opts.merge!({:methods => [:updated_by], :updated_by => {:methods => [], :exclude => [:created_at, :updated_at]}})
    end
    to_x(opts, doc)
  end

end
