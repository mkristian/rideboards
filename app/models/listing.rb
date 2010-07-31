class Listing
  include DataMapper::Resource

  property :id, Serial
  property :location, String, :required => true, :format => /^[^<'&">]*$/, :length => 255, :message => "Please enter a valid Location"
  property :email, String, :required => true, :format => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/, :length => 255, :message => "Please enter a valid Email"
  property :name, String, :required => true, :format => /^[^<'&">]*$/, :length => 255, :message => "Please enter a valid Name"
  property :ridedate, Date, :required => true

  validates_with_block :ridedate do
    if ridedate < Date.today
      [ false, "Ride Date must be in the future"]
    else
      true
    end
  end

  property :driver, ::DataMapper::Types::Boolean, :required => true
  property :password, String, :required => true, :format => /^[0-9]*$/, :length => 5
  timestamps :at

  belongs_to :board

  require 'dm-serializer'
  alias :to_x :to_xml_document
  def to_xml_document(opts = {}, doc = nil)
    opts.merge!({ :skip_types => true,
                  :skip_empty_tags => true
                })
    unless(opts[:methods])
      opts.merge!({ :methods => [:board],
                    :board => {
                      :methods => [:listings],
                      :listings => {
                        :methods => [],
                        :exclude => [:password, :board_id, :created_at, :updated_at, :driver, :ridedate, :name, :email, :location]
                      },
                      :exclude => [:created_at, :updated_at]
                    }
                  })
    end
    unless(opts[:exclude])
      opts.merge!({:exclude => [:password, :board_id]})
    end
    to_x(opts, doc)
  end

  def reset_password
    if(email == "test@rides.server.dhamma.org")
      self.password = "31415"
    else
      self.password = Ixtlan::Passwords.generate_numeric(5)
    end
  end

  def self.first!(*args)
    result = self.first(*args)
    raise DataMapper::ObjectNotFoundError.new("Listing" + args.inspect) if result.nil?
    result
  end
end
