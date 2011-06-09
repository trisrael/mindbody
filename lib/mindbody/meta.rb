module Mb::Meta
	NS = :_5 #Name for soap elements
	WSDL_PREFIX = "http://clients.mindbodyonline.com/api/0_5/"
	WSDL_POSTFIX = ".asmx?WSDL"

	#Returns the Mindody API url for the XML WSDL describing the server of @param service_name
	def wsdl_url(service_name)
		WSDL_PREFIX + service_name + WSDL_POSTFIX
	end
end
