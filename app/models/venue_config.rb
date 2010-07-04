class VenueConfig
  include DataMapper::Resource

  property :id, Serial
  property :locale_id, Integer, :required => true
  property :venue_id, Integer, :required => true
  property :date_format, String, :required => true, :format => /^[^<'&">]*$/, :length => 255
  property :home_url, String, :required => true, :format => /^[^<'&">]*$/, :length => 255
  property :schedule_url, String, :required => true, :format => /^[^<'&">]*$/, :length => 255
  property :checklist_url, String, :required => true, :format => /^[^<'&">]*$/, :length => 255
  property :iframe_url, String, :required => true, :format => /^[^<'&">]*$/, :length => 255
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
