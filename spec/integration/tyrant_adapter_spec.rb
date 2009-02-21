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

  it "should successfully find all objects" do
    heffalumps = [::Heffalump.create(:id => '1', :title => "Purple", :description => "this is one"),
                  ::Heffalump.create(:id => '2', :title => "Pink",   :description => "this is two"),
                  ::Heffalump.create(:id => '3', :title => "Blue",   :description => "this is three")]

    ::Heffalump.all.should == heffalumps
  end

  it "should successfuly delete an object" do
    @heffalump.destroy.should == true
  end
end
