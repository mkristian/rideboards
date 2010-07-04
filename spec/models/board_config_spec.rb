require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
USER = Object.full_const_get(Ixtlan::Models::USER) unless Object.const_defined? "USER"
describe BoardConfig do
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
      :board_id => 1,
      :locale_id => 1,
      :map_url => "value for map_url",
      :directions_url => "value for directions_url"
    }
  end

  it "should create a new instance given valid attributes" do
    BoardConfig.all(:board_id => 1).destroy!
    board_config = BoardConfig.create(@valid_attributes)
    board_config.valid?.should be_true
  end

  it "should require board_id" do
    board_config = BoardConfig.create(@valid_attributes.merge(:board_id => nil))
    board_config.errors.on(:board_id).should_not == nil
  end


  it "should be numerical board_id" do
    board_config = BoardConfig.create(@valid_attributes.merge(:board_id => "none-numberic" ))
    board_config.board_id.to_i.should == 0
    board_config.errors.size.should == 1
  end

  it "should require locale_id" do
    board_config = BoardConfig.create(@valid_attributes.merge(:locale_id => nil))
    board_config.errors.on(:locale_id).should_not == nil
  end


  it "should be numerical locale_id" do
    board_config = BoardConfig.create(@valid_attributes.merge(:locale_id => "none-numberic" ))
    board_config.locale_id.to_i.should == 0
    board_config.errors.size.should == 1
  end

  it "should require map_url" do
    board_config = BoardConfig.create(@valid_attributes.merge(:map_url => nil))
    board_config.errors.on(:map_url).should_not == nil
  end

  it 'should not match map_url' do
    board_config = BoardConfig.create(@valid_attributes.merge(:map_url => "<script" ))
    board_config.errors.on(:map_url).should_not == nil
    board_config = BoardConfig.create(@valid_attributes.merge(:map_url => "sc'ript" ))
    board_config.errors.on(:map_url).should_not == nil
    board_config = BoardConfig.create(@valid_attributes.merge(:map_url => "scr&ipt" ))
    board_config.errors.on(:map_url).should_not == nil
    board_config = BoardConfig.create(@valid_attributes.merge(:map_url => 'scr"ipt' ))
    board_config.errors.on(:map_url).should_not == nil
    board_config = BoardConfig.create(@valid_attributes.merge(:map_url => "script>" ))
    board_config.errors.on(:map_url).should_not == nil
  end

  it "should require directions_url" do
    board_config = BoardConfig.create(@valid_attributes.merge(:directions_url => nil))
    board_config.errors.on(:directions_url).should_not == nil
  end

  it 'should not match directions_url' do
    board_config = BoardConfig.create(@valid_attributes.merge(:directions_url => "<script" ))
    board_config.errors.on(:directions_url).should_not == nil
    board_config = BoardConfig.create(@valid_attributes.merge(:directions_url => "sc'ript" ))
    board_config.errors.on(:directions_url).should_not == nil
    board_config = BoardConfig.create(@valid_attributes.merge(:directions_url => "scr&ipt" ))
    board_config.errors.on(:directions_url).should_not == nil
    board_config = BoardConfig.create(@valid_attributes.merge(:directions_url => 'scr"ipt' ))
    board_config.errors.on(:directions_url).should_not == nil
    board_config = BoardConfig.create(@valid_attributes.merge(:directions_url => "script>" ))
    board_config.errors.on(:directions_url).should_not == nil
  end

end
