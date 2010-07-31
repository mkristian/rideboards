class Contact
  attr_accessor :name, :email, :phone

  def model
    self.class
  end

  def key
    name
  end

  def initialize(contact = nil)
    if contact
      self.name = contact[:name]
      self.email = contact[:email]
      self.phone = contact[:phone]
      @my_listing_id = contact[:listing_id]
      @my_listing = contact[:listing]
    end
  end

  def valid?
    validate
    errors.size == 0
  end

  def errors
#    validate
    @my_errors ||= {}
    def @my_errors.invalid?(attr)
      self[attr.to_sym] || false
    end
    def @my_errors.count
      self.size
    end
    def @my_errors.full_messages
      self.values
    end
    @my_errors
  end
  
  def validate
    errors
    @my_errors[:listing] = "listing cannot be blank" if (@my_listing == nil && @my_listing_id == nil)
    @my_errors[:name] = "Please fill in a valid name" if (name =~ /^[^<'&">]*$/).nil? || name.blank?
    @my_errors[:phone] = "Please fill in a valid phone number" if !phone.blank? && (phone =~ /^[-0-9() +]+$/).nil?
    @my_errors[:email] = "Please fill in a valid email address" unless self.email =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/
  end

  def listing_id
    listing.id
  end

  def listing=(listing)
    @my_listing = listing
  end

  def listing
    @my_listing = Listing.find(@my_listing_id) if @my_listing == nil and @my_listing_id != nil
    @my_listing
  end
end
