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

	#Append namespace to provided string (when @xml_ns) instance variable available
	def ns(string)
		@xmls_ns + string
	end

end

#MB Request Objects
class SourceCredentials
	include MindbodyAPI

	attr_accessor :source_name, :password, :site_ids, :xml_ns
	  
	def initialize(source_name, password, site_ids)
		 @source_name = source_name
		 @password = password
		 @site_ids = site_ids
	end

	#Takes members of class and returns XML versions with each as sibling nodes to one another
	#Example:
	#	<ns:node1>text</ns:node1><ns:node2>text</ns:node2>
	#
	def to_soap
				
	end

end

class UserCredentials
	include MindbodyAPI

	attr_accessor :username, :password, :site_ids, :xml_ns
	  
	def initialize(username, password, site_ids)
		 @username = username
		 @password = password
		 @site_ids = site_ids
	end
	
	#Takes members of class and returns XML versions with each as sibling nodes to one another
	#Example:
	#	<ns:node1>text</ns:node1><ns:node2>text</ns:node2>
	#
	def to_soap
		
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
	include MindbodyAPI

	#Namespace for XML SOAP document 
	attr_accessor :xms_ns

 	on_create_document do |doc|
    	doc.alias @xml_ns, GetApiNamespace()
	end

	attr_accessor :sourceCredentials, :userCredentials

	#You can store a set of default SourceCredentials in the object if you are using the 
	#same ones multiple times.
	#@param SourceCredentials $credentials
	def initialize(defaultCreds = null, defaultUserCreds = null)
		@sourceCredentials = defaultCreds;
		@userCredentials = defaultUserCreds;

		@sourceCredentials.xml_ns = @xml_ns
		@userCredentials.xml_ns = @xml_ns
	end
	
	#Invoke the @param service_name, name of SOAP service to be called
	#including the sourceCredentials and userCredentials, then the method yields 	
	def invoke_with_credentials(service_name)
		response = invoke(service_name) do |msg|
			msg.add ns('SourceCredentials'), sourceCredentials.to_soap if sourceCredentials
			msg.add ns('UserCredentials'), userCredentials.to_soap if userCredentials
			yield(msg)	#Allow block to add additional entries into SOAP request
		end
	end

end
	



