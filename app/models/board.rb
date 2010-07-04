class Board
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true, :format => /^[^<'&">]*$/, :length => 255
  property :fullname, String, :required => true, :format => /^[^<'&">]*$/, :length => 255
  property :position, Integer, :required => true
  property :enabled, ::DataMapper::Types::Boolean, :required => true
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
