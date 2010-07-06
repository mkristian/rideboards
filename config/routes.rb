ActionController::Routing::Routes.draw do |map|
  map.resources :listings

  map.resources :boards

  map.resources :board_configs

  map.resources :venue_configs

  map.resources :venues

  map.resources :audits

  map.resource :authentication

  map.resource :configuration

  map.resources :locales

  map.resources :locales

  map.resources :word_bundles

  map.resources :phrases

  map.resources :domains

  map.resources :domains

  map.resources :groups

  map.resources :groups

  map.resources :users

  map.resources :users

  map.resources :permissions

  #
  # public students' UI from here on
  #
  map.resources :boards, :controller => "public_boards", :path_prefix => ":lang/:venue" do |board|
    
    board.resources :listings, :controller => "public_listings", :new => { :wanted => :get }
    board.resources :listings, :controller => "public_listings", :new => { :offer => :get }
    board.resources :listings, :controller => "public_listings", :member => { :reminder => :post }
    board.resources :listings, :controller => "public_listings" do |listing|
      listing.resource :contact
    end
  end
  
  # named venue and named board (if visable) with language choice
  map.connect ":lang/:venue/:board", :controller => "public_boards", :action => "show"
  map.connect ":lang/:venue/:board/index.html", :controller => "public_boards", :action => "show"

  # named venue with language choice
  map.connect ":lang/:venue", :controller => "public_boards", :action => "show"
  map.connect ":lang/:venue/index.html", :controller => "public_boards", :action => "show"

  # named venue with language negotiation
  map.connect ":venue", :controller => "public_boards", :action => "shows"
  map.connect ":venue/index.html", :controller => "public_boards", :action => "show"
  
end
