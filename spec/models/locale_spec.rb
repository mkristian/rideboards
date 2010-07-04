require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
USER = Object.full_const_get(Ixtlan::Models::USER) unless Object.const_defined? "USER"
describe Locale do
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
      :code => "vc"
    }
  end

  it "should create a new instance given valid attributes" do
    Locale.all(:code => "vc").destroy!
    locale = Locale.create(@valid_attributes)
    locale.valid?.should be_true
  end

  it "should require code" do
    locale = Locale.create(@valid_attributes.merge(:code => nil))
    locale.errors.on(:code).should_not == nil
  end

  it 'should not match code' do
    locale = Locale.create(@valid_attributes.merge(:code => "<script" ))
    locale.errors.on(:code).should_not == nil
    locale = Locale.create(@valid_attributes.merge(:code => "sc'ript" ))
    locale.errors.on(:code).should_not == nil
    locale = Locale.create(@valid_attributes.merge(:code => "scr&ipt" ))
    locale.errors.on(:code).should_not == nil
    locale = Locale.create(@valid_attributes.merge(:code => 'scr"ipt' ))
    locale.errors.on(:code).should_not == nil
    locale = Locale.create(@valid_attributes.merge(:code => "script>" ))
    locale.errors.on(:code).should_not == nil
  end

end
