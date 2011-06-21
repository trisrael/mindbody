require 'savon'

module Mb
	class Service
		extend Meta

		SRC_CREDS = "SourceCredentials"
		class << self; attr_accessor :endpoint; end

		#Sets up the service WSDL endpoint given a Mindbody service name
		def self.service(service_name)
			@endpoint = self.wsdl_url(service_name)
		end

		#Returns the endpoint (a WSDL document) that this service is using to
		#access its methods, if a url is supplied the endpoint it updated and then returned
		def self.endpoint(url = nil)
			@endpoint = url if url
			@endpoint
		end
			
		def endpoint
			self.class.endpoint
		end
	
		attr_accessor :client, :src_creds, :usr_creds

		def initialize(options = {})
			@client = nil
			@src_creds = options[:source_credentials]
			@usr_creds = options[:user_credentials]
		
			@client = Savon::Client.new endpoint
		end

		#Builds the inner XML of the Mindbody SOAP call
		def build_request(options = {})
				throw options.keys.inspect
				src_creds_name = SRC_CREDS

				options  = options.dup #Don't clobber the original hash

				#NOTE: Could extend this to read WSDL document or using Savon client to tell which nodes are allowed in the request
				#performing the same type of test against passed in variables on each and replacing with the appropriate value

				options.keys.each do |key|
					orig_key = key
					new_key = orig_key.to_s.gsub("_", "").downcase
					if (new_key == src_creds_name.downcase)
						options[src_creds_name] = options[key] #Set "SourceCredentials" to hash referenced by similarly named
						options.delete(orig_key)
					end
				end
		
				request_body = 
				{
					"PageSize" => 10, 
					"XMLDetail" => "Bare",
					"CurrentPageIndex" => 0
				}

				request_body[src_creds_name] = @src_creds.to_hash if @src_creds
				request_body["UserCredentials"] = @usr_creds.to_hash if @usr_creds	

				return request_body.deep_merge!(options)
		end

		#Build a Mindbody SOAP request for the given service 
		def get_service(service_symbol, options)
		    raise "No SOAP client instantiated" unless @client

			request_options = build_request(options)
			raise "No SourceCredentials supplied" if !@src_creds && !options[SRC_CREDS] #Just checking for :source_credentials does not 
			#check all possiblities as "SourceCredentials", 
			response = @client.request Mb::Meta::NS, service_symbol do
				soap.body = 
				{	
					"Request" => request_options
				}
			end
		end
	
		def method_missing(method_id, *arguments, &block)
	  		if method_id.to_s =~ /^get_\w+/
				options = arguments[0] || {}
				get_service method_id.to_sym, options.is_a?(Hash) ? options : {}			
			else
				super
			end	
		end

		def respond_to?(method_id, include_private = false)
			if method_id.to_s =~ /^get_\w+/
				true
			else
				super
			end
		end

	end
end
