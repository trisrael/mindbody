#File contains all the soap references we need to communicate with the MINDBODY V0.5 API using Ruby.
require 'handsoap'

module MindbodyAPI

	# Gets the hostname for the Api environment.
	def get_api_hostname
		"clients.mindbodyonline.com"
	end

	def get_api_namespace
		"http://clients.mindbodyonline.com/api/0_5"
	end


end

#MB Request Objects
class SourceCredentials

	attr_accessor :source_name, :password, :site_ids
	  
	def initialize(source_name, password, site_ids)
		 @source_name = source_name
		 @password = password
		 @site_ids = site_ids
	end

	#Takes members of class and returns XML versions with each as sibling nodes to one another
	#Example:
	#	<ns:node1>text</ns:node1><ns:node2>text</ns:node2>
	def build_soap!(msg)
		msg.add "SourceCredentials" do |node|
			node.add "SourceName", @username
			node.add "Password", @password
			node.add "siteIDs" do |inner_node|
				@site_ids.each do |i|
					inner_node.add "int", i
				end
			end		
		end
	end

end

class UserCredentials
	attr_accessor :username, :password, :site_ids
	  
	def initialize(username, password, site_ids)
		@username = username
		@password = password	

		begin
			site_ids.send(:count) #Is this an array?
		rescue
			site_ids = site_ids = [site_ids]
		end		
				
		@site_ids = site_ids
	end
	
	#Takes members of class and returns XML versions with each as sibling nodes to one another
	#Example:
	#	<ns:node1>text</ns:node1><ns:node2>text</ns:node2>
	def build_soap!(msg)
		msg.add "UserCredentials"	do |node|
			node.add "Username", @username
			node.add "Sassword", @password
			node.add "SiteIDs" do |inner_node|
				@site_ids.each do |i|
					inner_node.add "int", i
				end
			end		
		end
	end
end

#Constants for xmldetail parameter of Mindbody SOAP calls
module XMLDetail
	Bare = 'Bare'
	Basic = 'Basic'
	Full = 'Full'
end

#Base class for MindBody services, all services include sourceCredentials and userCredentials for 
#authentication purposes. The :invoke_with_credentials method includes the aforementioned members
#in the SOAP XML to be transmitted to the Mindbody server
class MBService < Handsoap::Service
	extend MindbodyAPI

	#Member variables 
	attr_accessor :xms_ns, :sourceCredentials, :userCredentials

 	on_create_document do |doc|
    	doc.alias @xml_ns, GetApiNamespace()
	end

	#You can store a set of default SourceCredentials in the object if you are using the 
	#same ones multiple times.
	#@param SourceCredentials $credentials
	def initialize(defaultCreds = null, defaultUserCreds = null, xml_ns)
		@sourceCredentials = defaultCreds;
		@userCredentials = defaultUserCreds;
		@xml_ns = xml_ns
	end
	
	#Invoke the @param service_name, name of SOAP service to be called
	#including the sourceCredentials and userCredentials, then the method yields 	
	def invoke_with_credentials(service_name)
		response = invoke(service_name) do |msg|
			sourceCredentials.build_soap!(msg) if sourceCredentials
			userCredentials.build_soap!(msg) if userCredentials
			yield(msg) #Allow block to add additional entries into SOAP request
		end
	end

end
	



