class Listing
  include DataMapper::Resource

  property :id, Serial
  property :location, String, :required => true, :format => /^[^<'&">]*$/, :length => 255
  property :email, String, :required => true, :format => /^[^<'&">]*$/, :length => 255
  property :name, String, :required => true, :format => /^[^<'&">]*$/, :length => 255
  property :ridedate, Date, :required => true
  property :driver, ::DataMapper::Types::Boolean, :required => true
  property :password, String, :required => true, :format => /^[^<'&">]*$/, :length => 255
  timestamps :at

#   modified_by Ixtlan::Models::USER

  belongs_to :board

  require 'dm-serializer'
  alias :to_x :to_xml_document
  def to_xml_document(opts = {}, doc = nil)
    unless(opts[:methods])
      opts.merge!({:methods => [:updated_by], :updated_by => {:methods => [], :exclude => [:created_at, :updated_at]}})
    end
    to_x(opts, doc)
  end

  def reset_password
    if(email == "test@rides.server.dhamma.org")
      self.password = "31415"
    else
      self.password = Ixtlan::Passwords.generate(5)
    end
  end

  def self.first!(*args)
    result = self.first(*args)
    raise DataMapper::ObjectNotFoundError.new("Listing" + args.inspect) if result.nil?
    result
  end
end
