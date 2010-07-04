require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
USER = Object.full_const_get(Ixtlan::Models::USER) unless Object.const_defined? "USER"
describe VenueConfig do
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
      :locale_id => 1,
      :venue_id => 1,
      :date_format => "value for date_format",
      :home_url => "value for home_url",
      :schedule_url => "value for schedule_url",
      :checklist_url => "value for checklist_url",
      :iframe_url => "value for iframe_url"
    }
  end

  it "should create a new instance given valid attributes" do
    VenueConfig.all(:locale_id => 1).destroy!
    venue_config = VenueConfig.create(@valid_attributes)
    venue_config.valid?.should be_true
  end

  it "should require locale_id" do
    venue_config = VenueConfig.create(@valid_attributes.merge(:locale_id => nil))
    venue_config.errors.on(:locale_id).should_not == nil
  end


  it "should be numerical locale_id" do
    venue_config = VenueConfig.create(@valid_attributes.merge(:locale_id => "none-numberic" ))
    venue_config.locale_id.to_i.should == 0
    venue_config.errors.size.should == 1
  end

  it "should require venue_id" do
    venue_config = VenueConfig.create(@valid_attributes.merge(:venue_id => nil))
    venue_config.errors.on(:venue_id).should_not == nil
  end


  it "should be numerical venue_id" do
    venue_config = VenueConfig.create(@valid_attributes.merge(:venue_id => "none-numberic" ))
    venue_config.venue_id.to_i.should == 0
    venue_config.errors.size.should == 1
  end

  it "should require date_format" do
    venue_config = VenueConfig.create(@valid_attributes.merge(:date_format => nil))
    venue_config.errors.on(:date_format).should_not == nil
  end

  it 'should not match date_format' do
    venue_config = VenueConfig.create(@valid_attributes.merge(:date_format => "<script" ))
    venue_config.errors.on(:date_format).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:date_format => "sc'ript" ))
    venue_config.errors.on(:date_format).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:date_format => "scr&ipt" ))
    venue_config.errors.on(:date_format).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:date_format => 'scr"ipt' ))
    venue_config.errors.on(:date_format).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:date_format => "script>" ))
    venue_config.errors.on(:date_format).should_not == nil
  end

  it "should require home_url" do
    venue_config = VenueConfig.create(@valid_attributes.merge(:home_url => nil))
    venue_config.errors.on(:home_url).should_not == nil
  end

  it 'should not match home_url' do
    venue_config = VenueConfig.create(@valid_attributes.merge(:home_url => "<script" ))
    venue_config.errors.on(:home_url).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:home_url => "sc'ript" ))
    venue_config.errors.on(:home_url).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:home_url => "scr&ipt" ))
    venue_config.errors.on(:home_url).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:home_url => 'scr"ipt' ))
    venue_config.errors.on(:home_url).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:home_url => "script>" ))
    venue_config.errors.on(:home_url).should_not == nil
  end

  it "should require schedule_url" do
    venue_config = VenueConfig.create(@valid_attributes.merge(:schedule_url => nil))
    venue_config.errors.on(:schedule_url).should_not == nil
  end

  it 'should not match schedule_url' do
    venue_config = VenueConfig.create(@valid_attributes.merge(:schedule_url => "<script" ))
    venue_config.errors.on(:schedule_url).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:schedule_url => "sc'ript" ))
    venue_config.errors.on(:schedule_url).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:schedule_url => "scr&ipt" ))
    venue_config.errors.on(:schedule_url).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:schedule_url => 'scr"ipt' ))
    venue_config.errors.on(:schedule_url).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:schedule_url => "script>" ))
    venue_config.errors.on(:schedule_url).should_not == nil
  end

  it "should require checklist_url" do
    venue_config = VenueConfig.create(@valid_attributes.merge(:checklist_url => nil))
    venue_config.errors.on(:checklist_url).should_not == nil
  end

  it 'should not match checklist_url' do
    venue_config = VenueConfig.create(@valid_attributes.merge(:checklist_url => "<script" ))
    venue_config.errors.on(:checklist_url).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:checklist_url => "sc'ript" ))
    venue_config.errors.on(:checklist_url).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:checklist_url => "scr&ipt" ))
    venue_config.errors.on(:checklist_url).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:checklist_url => 'scr"ipt' ))
    venue_config.errors.on(:checklist_url).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:checklist_url => "script>" ))
    venue_config.errors.on(:checklist_url).should_not == nil
  end

  it "should require iframe_url" do
    venue_config = VenueConfig.create(@valid_attributes.merge(:iframe_url => nil))
    venue_config.errors.on(:iframe_url).should_not == nil
  end

  it 'should not match iframe_url' do
    venue_config = VenueConfig.create(@valid_attributes.merge(:iframe_url => "<script" ))
    venue_config.errors.on(:iframe_url).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:iframe_url => "sc'ript" ))
    venue_config.errors.on(:iframe_url).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:iframe_url => "scr&ipt" ))
    venue_config.errors.on(:iframe_url).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:iframe_url => 'scr"ipt' ))
    venue_config.errors.on(:iframe_url).should_not == nil
    venue_config = VenueConfig.create(@valid_attributes.merge(:iframe_url => "script>" ))
    venue_config.errors.on(:iframe_url).should_not == nil
  end

end
