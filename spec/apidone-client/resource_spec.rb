require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Resource" do
  before :each do
    @resource  = Apidone::Client::Resource.new({:name=>"mike", :id=>"134234", :age=>23})
  end
  
  it "should have created methods" do
    @resource.methods.include?("name".to_sym).should be_true
    @resource.methods.include?("id".to_sym).should be_true
    @resource.methods.include?("age".to_sym).should be_true
  end
  
end