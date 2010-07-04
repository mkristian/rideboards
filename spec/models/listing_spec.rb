require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
USER = Object.full_const_get(Ixtlan::Models::USER) unless Object.const_defined? "USER"
describe Listing do
  before(:each) do
    user = USER.first
    unless user
      user = USER.new(:login => 'root', :email => 'root@exmple.com', :name => 'Superuser', :language => 'en', :id => 1, :created_at => DateTime.now, :updated_at => DateTime.now)
      user.created_by_id = 1
      user.updated_by_id = 1
      user.save!
    end
    @valid_attributes = {
      :current_user => user,
      :location => "value for location",
      :email => "value for email",
      :name => "value for name",
      :ridedate => Date.today,
      :driver => false,
      :password => "value for password"
    }
  end

  it "should create a new instance given valid attributes" do
    Listing.all(:location => "value for location").destroy!
    listing = Listing.create(@valid_attributes)
    listing.valid?.should be_true
  end

  it "should require location" do
    listing = Listing.create(@valid_attributes.merge(:location => nil))
    listing.errors.on(:location).should_not == nil
  end

  it 'should not match location' do
    listing = Listing.create(@valid_attributes.merge(:location => "<script" ))
    listing.errors.on(:location).should_not == nil
    listing = Listing.create(@valid_attributes.merge(:location => "sc'ript" ))
    listing.errors.on(:location).should_not == nil
    listing = Listing.create(@valid_attributes.merge(:location => "scr&ipt" ))
    listing.errors.on(:location).should_not == nil
    listing = Listing.create(@valid_attributes.merge(:location => 'scr"ipt' ))
    listing.errors.on(:location).should_not == nil
    listing = Listing.create(@valid_attributes.merge(:location => "script>" ))
    listing.errors.on(:location).should_not == nil
  end

  it "should require email" do
    listing = Listing.create(@valid_attributes.merge(:email => nil))
    listing.errors.on(:email).should_not == nil
  end

  it 'should not match email' do
    listing = Listing.create(@valid_attributes.merge(:email => "<script" ))
    listing.errors.on(:email).should_not == nil
    listing = Listing.create(@valid_attributes.merge(:email => "sc'ript" ))
    listing.errors.on(:email).should_not == nil
    listing = Listing.create(@valid_attributes.merge(:email => "scr&ipt" ))
    listing.errors.on(:email).should_not == nil
    listing = Listing.create(@valid_attributes.merge(:email => 'scr"ipt' ))
    listing.errors.on(:email).should_not == nil
    listing = Listing.create(@valid_attributes.merge(:email => "script>" ))
    listing.errors.on(:email).should_not == nil
  end

  it "should require name" do
    listing = Listing.create(@valid_attributes.merge(:name => nil))
    listing.errors.on(:name).should_not == nil
  end

  it 'should not match name' do
    listing = Listing.create(@valid_attributes.merge(:name => "<script" ))
    listing.errors.on(:name).should_not == nil
    listing = Listing.create(@valid_attributes.merge(:name => "sc'ript" ))
    listing.errors.on(:name).should_not == nil
    listing = Listing.create(@valid_attributes.merge(:name => "scr&ipt" ))
    listing.errors.on(:name).should_not == nil
    listing = Listing.create(@valid_attributes.merge(:name => 'scr"ipt' ))
    listing.errors.on(:name).should_not == nil
    listing = Listing.create(@valid_attributes.merge(:name => "script>" ))
    listing.errors.on(:name).should_not == nil
  end

  it "should require ridedate" do
    listing = Listing.create(@valid_attributes.merge(:ridedate => nil))
    listing.errors.on(:ridedate).should_not == nil
  end

  it "should require driver" do
    listing = Listing.create(@valid_attributes.merge(:driver => nil))
    listing.errors.on(:driver).should_not == nil
  end

  it "should require password" do
    listing = Listing.create(@valid_attributes.merge(:password => nil))
    listing.errors.on(:password).should_not == nil
  end

  it 'should not match password' do
    listing = Listing.create(@valid_attributes.merge(:password => "<script" ))
    listing.errors.on(:password).should_not == nil
    listing = Listing.create(@valid_attributes.merge(:password => "sc'ript" ))
    listing.errors.on(:password).should_not == nil
    listing = Listing.create(@valid_attributes.merge(:password => "scr&ipt" ))
    listing.errors.on(:password).should_not == nil
    listing = Listing.create(@valid_attributes.merge(:password => 'scr"ipt' ))
    listing.errors.on(:password).should_not == nil
    listing = Listing.create(@valid_attributes.merge(:password => "script>" ))
    listing.errors.on(:password).should_not == nil
  end

end
