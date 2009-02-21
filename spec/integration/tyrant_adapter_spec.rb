require 'pathname'
require Pathname(__FILE__).dirname.parent.join('spec.rb')

class ::Heffalump
  include DataMapper::Resource

  def self.default_repository_name
    :tyrant
  end

  property :id,          String, :key => true
  property :title,       String
  property :description, String
end

def create_heffalumps
  [::Heffalump.create(:id => '1', :title => "Purple", :description => "this is one"),
   ::Heffalump.create(:id => '2', :title => "Pink",   :description => "this is two"),
   ::Heffalump.create(:id => '3', :title => "Blue",   :description => "this is three")]
end

describe DataMapper::Adapters::TyrantAdapter do
  before do
    DataMapper.setup(:tyrant, :adapter => "tyrant")
    Heffalump.all.destroy!
    @heffalump = ::Heffalump.create(:id => '1', :title => "Purple", :description => "this is one")
  end

  it "should successfully save an object" do
    @heffalump.new_record?.should == false
  end

  it "should successfully update an object" do
    @heffalump.title = 'Green'
    @heffalump.save.should == true
  end

  it "should successfully update an object's attributes" do
    @heffalump.update_attributes(:title => 'Green').should == true
    Heffalump.get(@heffalump.id).title.should == 'Green'
  end

  it "should successfully find a single object" do
    ::Heffalump.get(@heffalump.id).should == @heffalump
  end

  it "should successfuly delete an object" do
    @heffalump.destroy.should == true
  end

  it "should successfully find all objects" do
    heffalumps = create_heffalumps
    ::Heffalump.all.should == heffalumps
  end

  it "should successfully find all objects by a property" do
    heffalumps = create_heffalumps
    ::Heffalump.all(:title => "Purple").should == heffalumps[1]
  end

  # OPTIMIZE: These are probably really poorly written specs
  it "should order by a property when finding objects" do
    heffalumps = create_heffalumps

    ::Heffalump.all(:order => [:id.asc]).should == heffalumps
    ::Heffalump.all(:order => [:id.desc]).should == heffalumps.reverse

    heffalumps_by_title = heffalumps.sort{ |x,y| x.title <=> y.title }
    ::Heffalump.all(:order => [:title.asc]).should == heffalumps_by_title
    ::Heffalump.all(:order => [:title.desc]).should == heffalumps_by_title.reverse
  end

  it "should limit found objects" do
    create_heffalumps
    ::Heffalump.all(:limit => 2).size.should == 2
  end
end
