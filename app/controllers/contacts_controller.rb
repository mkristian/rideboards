class ContactsController < PublicController
  
  public  
  def new
    @contact = Contact.new 
    @contact.listing = Listing.first!(:id => params[:listing_id], :board => @board)
    render :template => "public/contact"
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.listing = Listing.first!(:id => params[:listing_id], :board => @board)
    if @contact.valid?
      # first create the message
      email = Mailer.create_contact(@contact)

      # sent the message
      Mailer.deliver_contact(@contact)
      
      # finally display the message in the page
      # after clearing all the visual noise
      @message = email.encoded.gsub(/To: .*\n/, '').gsub(/Date: .*\n/, '').gsub(/From: .*\n/, '').gsub(/Subject: .*\n/, '').gsub(/Mime-Version: .*\n/, '').gsub(/Content-Type: .*\n/, '').sub(/\n/, '')
      render :template => "public/sent" 
    else
      render :template => "public/contact"
    end
  end
end
