class BoardConfig
  include DataMapper::Resource

  property :id, Serial
  property :board_id, Integer, :required => true
  property :locale_id, Integer, :required => true
  property :map_url, String, :required => true, :format => /^[^<'&">]*$/, :length => 255
  property :directions_url, String, :required => true, :format => /^[^<'&">]*$/, :length => 255
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
