require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Connection" do
  
  before(:each) do
    @c = Apidone::Client::Connection.new("dojoruby")
  end
  
  it "should return the base location" do
    @c.class.should == Apidone::Client::Connection
  end
  
  describe "when create resource" do
    before :each do
      @response = @c.create("lenguajes")
    end
    
    it "should be hash" do
      @response.class.should == Hash
    end
    
    it "should not be blank" do
      @response.should_not be_nil
    end
    
  end
  
  describe "when update resource" do
    before :each do 
      @list = @c.list("lenguajes")
      @rand_num = rand(100)
      @response = @c.update("lenjuages", "#{@list.first[:id]}", data = {:age=>@rand_num})
    end
    
    it "response should be hash" do
      @response.class.should == Hash
    end
    
    it "response should id" do
      @response[:age].should == @rand_num
    end
    
  end
  
  describe "when delete reosurce" do
    before :each do
      @list = @c.list("lenguajes")
      @id = @list.last["id"]
      @deleted= @c.delete("lenguajes", @id )
    end
    
    it "should be true" do
      @deleted.should be_true
    end
    
    it "should not include the id" do
      @list = @c.list("lenguajes")
      @list.map{|o| o["id"]}.should_not include(@id)
    end
    
  end
  
  describe "when show resource" do
    before :each do
      @list = @c.list("lenguajes")
      @id = @list.last["id"]
      @resource = @c.show("lenguajes", @id )
    end
    
    it "should find something" do
      @resource.should_not be_empty
    end
  end
  
end