require File.expand_path("../../lib/mindbody", __FILE__)

module SoapHelper
	ClassService = "ClassService"

	module Methods
		def local_wsdl(name_of_service)
			Rails.root + "/spec/fixtures/" + name_of_service 
		end	
	end
end
