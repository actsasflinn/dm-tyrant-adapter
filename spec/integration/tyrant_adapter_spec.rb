require 'pathname'
require Pathname(__FILE__).dirname.parent.join('spec.rb')

describe DataMapper::Adapters::TyrantAdapter do

  before do
    DataMapper.setup(:tyrant, :adapter => "tyrant")

    class ::Heffalump
      include DataMapper::Resource

      def self.default_repository_name
        :tyrant
      end

      property :title, String, :key => true
      property :description, String
    end

    @heff1 = Heffalump.create(:title => "Purple", :description => "this is one")
    @heff2 = Heffalump.create(:title => "Blue",   :description => "this is two")
    @heff2 = Heffalump.create(:title => "Pink",   :description => "this is three")
  end

  it "should successfully save an object" do
    @heff1.new_record?.should == false
  end
  
end
