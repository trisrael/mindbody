require 'savon'
class MBService
	extend MBMeta
	#Sets up the service WSDL endpoint given a Mindbody service name
	def self.service(service_name)
		@@endpoint = self.wsdl_url(service_name)
	end

	attr_accessor :client, :src_creds, :usr_creds

	def initialize(options = {})
		@client = nil
		@src_creds = options[:source_credentials]
		@usr_creds = options[:user_credentials]
		
		@client = Savon::Client.new @@endpoint if @@endpoint
	end

	#Builds the inner XML of the Mindbody SOAP call
	def build_request(options = {})
		
			request_body = 
			{
				"PageSize" => 10, 
				"XMLDetail" => "Bare",
				"CurrentPageIndex" => 0
			}

			request_body["SourceCredentials"] = @src_creds.to_hash if @src_creds
			request_body["UserCredentials"] = @usr_creds.to_hash if @usr_creds

			return request_body.deep_merge!(options)
	end

	#Build a Mindbody SOAP request for the given service 
	def get_service(service_symbol, options)
        raise "No SOAP client instantiated" unless @client

		raise "No SourceCredentials supplied" if !@src_creds && !options[:source_credentials]
		
		response = @client.request MBMeta::NS, service_symbol do
			soap.body = 
			{	
				"Request" => build_request(options) 
			}
		end
	end

	#Allows services to be called directly on the service and rerouted to 
	#the client 	
	def method_missing(m_name, *args, &block)
		options = args[0]
		get_service m_name.to_sym, options.is_a?(Hash) ? options : {}

	end
end
