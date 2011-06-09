require "spec_helper.rb"

describe Mb::Service do

	describe "#service" do

		before :all do
			load "fixtures/service_classes.rb"
		end
		
		it "should allow for subclasses to have unique endpoints" do
			TagService.endpoint.should_not == MailService.endpoint		
		end

		it "should allow for subclasses to inherit endpoints" do
			pending
			TagService.endpoint.should == CustomTagService.endpoint
		end

		it "should create new instances with no options" do
			lambda{Mb::Service.new}.should_not raise_error
		end

		it "instance endpoint method should not be nil" do	
			TagService.new.endpoint.should_not be_nil
		end
	end

	def setup_service_with_local_endpoint
		load "fixtures/service_classes_with_loc_endpoint.rb"
		"NewService"
	end
	
	describe "#endpoint" do

		before :all do
			setup_service_with_local_endpoint
		end

		it "should have methods available when local wsdl is used" do
			mb = nil
			lambda { mb = LocWsdlDocService.new }.should_not raise_error
			mb.client.should_not be_nil
			mb.client.wsdl.soap_actions.should_not be_empty			
		end

	end

	describe "#build_request" do
		before :all do
			setup_service_with_local_endpoint
		end
		
		before :each do
			@mb  = LocWsdlDocService.new
			@options = {:source_credentials => {"SourceName" => "Studio1", "Password" => "password", "SiteIDs" => 12345}}			
		end
		
		it "should allow for derivatives of 'SourceCredentials' to be passed as options and mapped correctly" do		
			@result = @mb.build_request @options
			@result["SourceCredentials"].should == @options[:source_credentials]
			@result.keys.should_not include :source_credentials
		end

		it "should not change original options hash" do
			orig  = @options.dup
			@mb.build_request @options
			@options.should  == orig
		end
	
	end
end
