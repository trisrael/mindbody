# -*- coding: utf-8 -*-

#File contains all the soap references we need to communicate with the MINDBODY V0.5 API using Ruby.
require 'handsoap'

module MindbodyAPI
	NS = "_5"

	# Gets the hostname for the Api environment.
	def get_api_hostname
		"clients.mindbodyonline.com"
	end

	def get_api_namespace
		"http://clients.mindbodyonline.com/api/0_5"
	end
end

module NamespaceHelper

	#Append a keyword with "_5" namespace
	def ns(str)
		val = MindbodyAPI::NS + ":" + str
		puts val
		val
	end

end

#MB Request Objects
class SourceCredentials
	include NamespaceHelper

	attr_accessor :source_name, :password, :site_ids
	  
	def initialize(source_name, password, site_ids)
		 @source_name = source_name
		 @password = password

		begin
			site_ids.count #Is this an array?
		rescue
			site_ids = [site_ids]
		end		
				
		@site_ids = site_ids
	end

	#Takes members of class and returns XML versions with each as sibling nodes to one another
	#Example:
	#	<ns:node1>text</ns:node1><ns:node2>text</ns:node2>
	def build_soap!(msg)
		msg.add ns("SourceCredentials") do |node|
			node.add ns("SourceName"), @source_name
			node.add ns("Password"), @password
			node.add ns("SiteIDs") do |inner_node|
				@site_ids.each do |i|
					inner_node.add ns("int"), i
				end
			end		
		end
	end
end

class UserCredentials
	include NamespaceHelper
	attr_accessor :username, :password, :site_ids
	  
	def initialize(username, password, site_ids)
		@username = username
		@password = password	

		begin
			site_ids.count #Is this an array?
		rescue
			site_ids = [site_ids]
		end		
				
		@site_ids = site_ids
	end
	
	#Takes members of class and returns XML versions with each as sibling nodes to one another
	#Example:
	#	<ns:node1>text</ns:node1><ns:node2>text</ns:node2>
	def build_soap!(msg)
		msg.add ns("UserCredentials") do |node|
			node.add ns("Username"), @username
			node.add ns("Password"), @password
			node.add ns("SiteIDs") do |inner_node|
				@site_ids.each do |i|
					inner_node.add ns("int"), i
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
	include NamespaceHelper

	#Member variables 
	attr_accessor :sourceCredentials, :userCredentials
	

	#You can store a set of default SourceCredentials in the object if you are using the 
	#same ones multiple times.
	#@param SourceCredentials $credentials
	def initialize(defaultCreds = nil, defaultUserCreds = nil)
		@sourceCredentials = defaultCreds;
		@userCredentials = defaultUserCreds;
	end
	
	#Invoke the @param service_name, name of SOAP service to be called
	#including the sourceCredentials and userCredentials, then the method yields 	
	def invoke_with_credentials(service_name, options)
		response = invoke(ns(service_name), :soap_action => MBService.get_api_namespace  + "/" + service_name) do |msg|

			msg.add ns("Request") do |request|
				sourceCredentials.build_soap!(request) if sourceCredentials
				userCredentials.build_soap!(request) if userCredentials
				request.add ns("CurrentPageIndex"), options[:current_page] || 0
				request.add ns("PageSize"), options[:current_page] || 0
				request.add ns("XMLDetail"), options[:xml_detail] || XMLDetail::Bare
				request.add ns("Fields"), options[:fields] if options[:fields]
				#yield(request) #Allow block to add additional entries into SOAP request
				puts msg.to_s
			end

		end
		response.force_encoding("UTF-8");
		return response
	end

	#When no specialty XML needs to be specified into the 'Request' node, this simple method
	#allows a service name to be specified and calls upon the service referenced 
	def get_service(service_name, options = {})
		response = invoke_with_credentials(service_name, options)
		return response
	end

end
