class Board
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true, :format => /^[^<'&">]*$/, :length => 255
  property :fullname, String, :required => true, :format => /^[^<'&">]*$/, :length => 255
  property :position, Integer, :required => true
  property :enabled, ::DataMapper::Types::Boolean, :required => true
  timestamps :at

  modified_by Ixtlan::Models::USER

  belongs_to :venue

  has n, :board_configs
  has n, :listings

  require 'dm-serializer'
  alias :to_x :to_xml_document
  def to_xml_document(opts = {}, doc = nil)
    unless(opts[:methods])
      opts.merge!({:methods => [:updated_by], :updated_by => {:methods => [], :exclude => [:created_at, :updated_at]}})
    end
    to_x(opts, doc)
  end

  def locale= (locale, create = false)
    @lang = BoardConfig.first(:board => self, :locale => locacle)

    # create a new one if needed and wanted
    @lang = BoardConfig.create(:locale => locale, :board => self) if @lang.nil? && create
  end

  #create delegate methods
  %w(directions_url map_url).each do |name|
    class_eval <<-CODE, __FILE__, __LINE__
      def #{name}
        @lang.#{name} if @lang
      end

      def #{name}?
        !(@lang && @lang.#{name}).blank?
      end
CODE
  end
end
