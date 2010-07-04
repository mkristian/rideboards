require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
USER = Object.full_const_get(Ixtlan::Models::USER) unless Object.const_defined? "USER"
describe Venue do
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
      :fullname => "value for fullname",
      :email => "value for email",
      :password => "value for password",
      :bcc => false,
      :enabled => false
    }
  end

  it "should create a new instance given valid attributes" do
    Venue.all(:fullname => "value for fullname").destroy!
    venue = Venue.create(@valid_attributes)
    venue.valid?.should be_true
  end

  it "should require fullname" do
    venue = Venue.create(@valid_attributes.merge(:fullname => nil))
    venue.errors.on(:fullname).should_not == nil
  end

  it 'should not match fullname' do
    venue = Venue.create(@valid_attributes.merge(:fullname => "<script" ))
    venue.errors.on(:fullname).should_not == nil
    venue = Venue.create(@valid_attributes.merge(:fullname => "sc'ript" ))
    venue.errors.on(:fullname).should_not == nil
    venue = Venue.create(@valid_attributes.merge(:fullname => "scr&ipt" ))
    venue.errors.on(:fullname).should_not == nil
    venue = Venue.create(@valid_attributes.merge(:fullname => 'scr"ipt' ))
    venue.errors.on(:fullname).should_not == nil
    venue = Venue.create(@valid_attributes.merge(:fullname => "script>" ))
    venue.errors.on(:fullname).should_not == nil
  end

  it "should require email" do
    venue = Venue.create(@valid_attributes.merge(:email => nil))
    venue.errors.on(:email).should_not == nil
  end

  it 'should not match email' do
    venue = Venue.create(@valid_attributes.merge(:email => "<script" ))
    venue.errors.on(:email).should_not == nil
    venue = Venue.create(@valid_attributes.merge(:email => "sc'ript" ))
    venue.errors.on(:email).should_not == nil
    venue = Venue.create(@valid_attributes.merge(:email => "scr&ipt" ))
    venue.errors.on(:email).should_not == nil
    venue = Venue.create(@valid_attributes.merge(:email => 'scr"ipt' ))
    venue.errors.on(:email).should_not == nil
    venue = Venue.create(@valid_attributes.merge(:email => "script>" ))
    venue.errors.on(:email).should_not == nil
  end

  it "should require password" do
    venue = Venue.create(@valid_attributes.merge(:password => nil))
    venue.errors.on(:password).should_not == nil
  end

  it 'should not match password' do
    venue = Venue.create(@valid_attributes.merge(:password => "<script" ))
    venue.errors.on(:password).should_not == nil
    venue = Venue.create(@valid_attributes.merge(:password => "sc'ript" ))
    venue.errors.on(:password).should_not == nil
    venue = Venue.create(@valid_attributes.merge(:password => "scr&ipt" ))
    venue.errors.on(:password).should_not == nil
    venue = Venue.create(@valid_attributes.merge(:password => 'scr"ipt' ))
    venue.errors.on(:password).should_not == nil
    venue = Venue.create(@valid_attributes.merge(:password => "script>" ))
    venue.errors.on(:password).should_not == nil
  end

  it "should require bcc" do
    venue = Venue.create(@valid_attributes.merge(:bcc => nil))
    venue.errors.on(:bcc).should_not == nil
  end

  it "should require enabled" do
    venue = Venue.create(@valid_attributes.merge(:enabled => nil))
    venue.errors.on(:enabled).should_not == nil
  end

end
