require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe 'Distributable' do
	before(:each) do
		@user = Distributed::User.new( :name => 'My Name', :state => 'active' )
		@admin = Distributed::User.new( :name => 'Administrator', :state => 'active' )
	end

	after(:each) do
		User.destroy_all
	end

	it "should be able to save object" do
		@user.save.should be_true
	end

	it "should be able to find a saved user" do
		@user.save
		same_user = Distributed::User.find(:first)
		same_user.name.should == 'My Name'
		same_user.state.should == 'active'
	end

	it "should use callbacks" do
		@admin.save
		@admin.is_admin.should be_true
	end
end
