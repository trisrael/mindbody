class MBClassService < MBService
	extend MindbodyAPI

	endpoint :version => 1, :uri => "http://clients.mindbodyonline.com/api/0_5/ClassService.asmx"

	def get_class_service(service_name, pageSize = nil, currentPageIndex = nil, xmlDetail = XMLDetail::Bare, fields = nil)
		response = invoke_with_credentials(service_name) do |msg|
			msg.add ns("CurrentPageIndex"), currentPageIndex if currentPageIndex
			msg.add ns("PageSize"), pageSize if pageSize
			msg.add ns("XMLDetail"), xmlDetail if xmlDetail
			msg.add ns("Fields"), fields if fields
		end
		return response
	end

	 # Returns the raw result of the MINDBODY SOAP call.
	 # @param pageSize
	 #@param currentPage
	 # @param xmlDetail
	 # @param fields
	 # @param credentials A source credentials object to use with this call
	 # @return object The raw result of the SOAP call
	def get_classes(pageSize = 10, currentPageIndex = 0, xmlDetail = XMLDetail::Bare, fields = nil)
		return get_class_service("GetClasses", pageSize, currentPageIndex, xmlDetail, fields)
	end

	def get_class_schedules(pageSize = 10, currentPageIndex = 0, xmlDetail = XMLDetail::Bare, fields =nil)
		return get_class_service("GetClassSchedules", pageSize, currentPageIndex, xmlDetail, fields)		
	end
	

end

