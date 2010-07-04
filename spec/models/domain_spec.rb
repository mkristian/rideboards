require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
USER = Object.full_const_get(Ixtlan::Models::USER) unless Object.const_defined? "USER"
describe Domain do
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
      :name => "valueofname"
    }
  end

  it "should create a new instance given valid attributes" do
    Domain.all(:name => "valueofname").destroy!
    domain = Domain.create(@valid_attributes)
    domain.valid?.should be_true
  end

  it "should require name" do
    domain = Domain.create(@valid_attributes.merge(:name => nil))
    domain.errors.on(:name).should_not == nil
  end

  it 'should not match name' do
    domain = Domain.create(@valid_attributes.merge(:name => "<script" ))
    domain.errors.on(:name).should_not == nil
    domain = Domain.create(@valid_attributes.merge(:name => "sc'ript" ))
    domain.errors.on(:name).should_not == nil
    domain = Domain.create(@valid_attributes.merge(:name => "scr&ipt" ))
    domain.errors.on(:name).should_not == nil
    domain = Domain.create(@valid_attributes.merge(:name => 'scr"ipt' ))
    domain.errors.on(:name).should_not == nil
    domain = Domain.create(@valid_attributes.merge(:name => "script>" ))
    domain.errors.on(:name).should_not == nil
  end

end
