migration 20100705000000, :test_data do
  up do
    u = User.first
    d = Domain.create(:name => "test", :current_user => u)
    v = Venue.all.detect {|v| v.domain == d } || Venue.create(:domain => d, :fullname => "Dhamma Test", :current_user => u, :enabled => true, :email => "rides@test.dhamma.org")
    l = Locale.first(:code => "en") || Locale.create(:code => "en", :current_user => u)
    vc = VenueConfig.create(:venue => v, :locale => l, :home_url => "http://www.test.dhamma.org", :schedule_url => "http://www.dhamma.org/en/schtest.html", :current_user => u)
    b = Board.create(:name => "main", :current_user => u, :fullname => "Main Center", :position => 1, :enabled => true, :venue => v)
    BoardConfig.create(:current_user => u, :locale => l, :board => b)
    b = Board.create(:name => "none center location", :current_user => u, :fullname => "None Center", :position => 2, :enabled => true, :venue => v)
    BoardConfig.create(:current_user => u, :locale => l, :board => b)
  end

  down do
  end
end
