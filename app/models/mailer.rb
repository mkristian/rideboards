
class Mailer < ActionMailer::Base

  def forgot_password(recipient, pwd)
    @subject    = 'Rideboard'
    @body       = {:pwd => pwd}
    @recipients = recipient
    @from       = 'do-not-reply@rides.server.dhamma.org'
    @sent_on    = Time.now
    @headers    = {}
  end
  
  def contact(contact)
    @subject    = "Rideshare contact information" + (contact.listing.board.venue.bcc ? " for #{contact.listing.name} <#{contact.listing.email}>" : "")

    @bcc        = contact.listing.board.venue.email if contact.listing.board.venue.bcc
    @body       = {:contact => contact}
    @recipients = "#{contact.listing.name} <#{contact.listing.email}>"
    @from       = "#{contact.listing.board.venue.fullname} <#{contact.listing.board.venue.email}>"
    @sent_on    = Time.now
    @headers    = {}
  end
  
  def confirm(listing, board_url, locale)
    @subject    = "Rideshare email confirmation" + (listing.board.venue.bcc ? " for #{listing.name} <#{listing.email}>" : "")

    @bcc = listing.board.venue.email if listing.board.venue.bcc

    # first set the langugae state of the model instance
    #TODO  truncating might not be sufficient
    #listing.board.venue.lang_code = locale

    format = listing.board.venue.date_format || "%e.%b %Y"
   
    @body       = {:listing => listing,
      :board_url => board_url,
      :date =>  listing.ridedate.strftime(format).strip}
    @recipients = "#{listing.name} <#{listing.email}>"
    @from       = "#{listing.board.venue.fullname} <#{listing.board.venue.email}>"
    @sent_on    = Time.now
    @headers    = {}
    find_template(locale)
    logger.debug "(#{self.class}) using template #{@template} for locale #{locale}" if logger
  end

  def remind(listing, board_url)
    @subject    = 'Rideshare removal code reminder'
    @body       = {:listing => listing, :board_url => board_url}
    @recipients = "#{listing.name} <#{listing.email}>"
    @from       = "#{listing.board.venue.fullname} <#{listing.board.venue.email}>"
    @sent_on    = Time.now
    @headers    = {}

    # TODO remove hardcoded locale !!!!
    locale = "en_GB"
    find_template(locale)
    logger.debug "using template #{@template} for locale #{locale}" if logger
  end

  private
  def find_template(wanted_locale)
    if wanted_locale=~ /.*_.*/
      if do_find_template wanted_locale
        return
      end
      wanted_locale = wanted_locale.gsub(/_.*/, '')
    end
    do_find_template wanted_locale
  end

  def do_find_template(wanted_locale)
    templates = Dir.glob("#{template_path}/#{@template}.*.rhtml")
    templates.each do |path|
      basename = File.basename(path)
      locale = basename.gsub(/#{@template}.|.rhtml/, '')
      if locale == wanted_locale
        @template = basename
        return true
      end
    end
    return false
  end
end
