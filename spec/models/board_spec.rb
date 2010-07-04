require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
USER = Object.full_const_get(Ixtlan::Models::USER) unless Object.const_defined? "USER"
describe Board do
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
      :name => "value for name",
      :fullname => "value for fullname",
      :position => 1,
      :enabled => false
    }
  end

  it "should create a new instance given valid attributes" do
    Board.all(:name => "value for name").destroy!
    board = Board.create(@valid_attributes)
    board.valid?.should be_true
  end

  it "should require name" do
    board = Board.create(@valid_attributes.merge(:name => nil))
    board.errors.on(:name).should_not == nil
  end

  it 'should not match name' do
    board = Board.create(@valid_attributes.merge(:name => "<script" ))
    board.errors.on(:name).should_not == nil
    board = Board.create(@valid_attributes.merge(:name => "sc'ript" ))
    board.errors.on(:name).should_not == nil
    board = Board.create(@valid_attributes.merge(:name => "scr&ipt" ))
    board.errors.on(:name).should_not == nil
    board = Board.create(@valid_attributes.merge(:name => 'scr"ipt' ))
    board.errors.on(:name).should_not == nil
    board = Board.create(@valid_attributes.merge(:name => "script>" ))
    board.errors.on(:name).should_not == nil
  end

  it "should require fullname" do
    board = Board.create(@valid_attributes.merge(:fullname => nil))
    board.errors.on(:fullname).should_not == nil
  end

  it 'should not match fullname' do
    board = Board.create(@valid_attributes.merge(:fullname => "<script" ))
    board.errors.on(:fullname).should_not == nil
    board = Board.create(@valid_attributes.merge(:fullname => "sc'ript" ))
    board.errors.on(:fullname).should_not == nil
    board = Board.create(@valid_attributes.merge(:fullname => "scr&ipt" ))
    board.errors.on(:fullname).should_not == nil
    board = Board.create(@valid_attributes.merge(:fullname => 'scr"ipt' ))
    board.errors.on(:fullname).should_not == nil
    board = Board.create(@valid_attributes.merge(:fullname => "script>" ))
    board.errors.on(:fullname).should_not == nil
  end

  it "should require position" do
    board = Board.create(@valid_attributes.merge(:position => nil))
    board.errors.on(:position).should_not == nil
  end


  it "should be numerical position" do
    board = Board.create(@valid_attributes.merge(:position => "none-numberic" ))
    board.position.to_i.should == 0
    board.errors.size.should == 1
  end

  it "should require enabled" do
    board = Board.create(@valid_attributes.merge(:enabled => nil))
    board.errors.on(:enabled).should_not == nil
  end

end
