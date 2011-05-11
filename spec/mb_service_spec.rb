require "spec_helper.rb"

describe MBService, "#service" do
		
	it "should allow for subclasses to have unique endpoints" do
		TagService.endpoint.should_not == MailService.endpoint		
	end

	it "should allow for subclasses to inherit endpoints" do
		pending
		TagService.endpoint.should == CustomTagService.endpoint
	end

end


class TagService < MBService
	service "TagService"
end

class CustomTagService < TagService
end

class MailService < MBService
	service "MailService"
end

