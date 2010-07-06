class PublicController  < ActionController::Base

  layout "public"

  before_filter :public_filter

  skip_before_filter :authenticate, :guard, :check_session_expiry

  def session_timeout
    raise "ADsasd"
  end
  # p before_filters

  def public_filter
    @lang, @venue, @board = Venue.retrieve(params[:lang] || language_from_browser, params[:venue], params[:board] || params[:id] || params[:board_id])
    if(@venue)
      p (params[:board_id].nil? && params[:id].nil?)
      p (params[:board] != @board.name && params[:id] != @board.id.to_s && params[:board_id] != @board.id.to_s)
      if(params[:lang].nil? || params[:venue].nil? || (params[:id].nil? && params[:board_id].nil?) || params[:lang] != @lang.code || (params[:board] != @board.name && params[:id] != @board.id.to_s && params[:board_id] != @board.id.to_s))
        puts "-" * 80
        p @lang
        p @venue
        p @board
        redirect_to url_for(:controller => :public_boards, 
                            :action => :show, 
                            :venue => @venue.name,
                            :id => @board.id,
                            :lang => @lang.code)
        false
      elsif(@board.nil? || @lang.nil?)
        render_not_found
      else
        # TODO session tracking for venues with password
        @path_prefix = url_for(:controller => :public_boards, 
                            :action => :show, 
                            :venue => @venue.name,
                            :board => @board.name,
                            :lang => @lang.code)
        true
      end
    else
      # check for php pages
      php = File.join(RAILS_ROOT, 'public', params[:venue], "index.php")
      if (File.exists?(php))
        redirect_to "/#{params[:venue]}/index.php"
        false
      else
        render_not_found
      end
    end
  end

  def language_from_browser
    #get prefered browser language
    #TODO needs find the language from the browser which fits into
    #the venue's languages
    accept = request.env["HTTP_ACCEPT_LANGUAGE"]
    if accept
      lang = accept.split(",")[0]
      lang = lang[0..1]
    end
    
    # if no language could be found, fall back to default
    unless lang
      lang = 'en' #TODO @venue.default_language
    end   
    lang
  end

  def render_not_found
    render :template => "public/novenue", :layout => "error", :status => 404
    false
  end

end
