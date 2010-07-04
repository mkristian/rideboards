require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
USER = Object.full_const_get(Ixtlan::Models::USER) unless Object.const_defined? "USER"
describe Group do
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
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    Group.all(:name => "value for name").destroy!
    group = Group.create(@valid_attributes)
    group.valid?.should be_true
  end

  it "should require name" do
    group = Group.create(@valid_attributes.merge(:name => nil))
    group.errors.on(:name).should_not == nil
  end

  it 'should not match name' do
    group = Group.create(@valid_attributes.merge(:name => "<script" ))
    group.errors.on(:name).should_not == nil
    group = Group.create(@valid_attributes.merge(:name => "sc'ript" ))
    group.errors.on(:name).should_not == nil
    group = Group.create(@valid_attributes.merge(:name => "scr&ipt" ))
    group.errors.on(:name).should_not == nil
    group = Group.create(@valid_attributes.merge(:name => 'scr"ipt' ))
    group.errors.on(:name).should_not == nil
    group = Group.create(@valid_attributes.merge(:name => "script>" ))
    group.errors.on(:name).should_not == nil
  end

end
