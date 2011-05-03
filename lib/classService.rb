


class MBClassService extends MBAPIService

	endpoint GetApiNamespace() + "/ClassService.asmx?wsdl"
	
	/**
	 * Returns the raw result of the MINDBODY SOAP call.
	 * @param pageSize
	 * @param currentPage
	 * @param xmlDetail
	 * @param fields
	 * @param credentials A source credentials object to use with this call
	 * @return object The raw result of the SOAP call
	 */
	def getClasses(classDescriptionIDs, classIDs, staffIDs, startDate, endDate, clientID = null, pageSize = null, currentPage = null, xmlDetail = XMLDetail::Full, fields = null,  credentials = null)

		response = invoke_with_credentials( ns("GetClasses") ) do |msg|
			msg.add('ClassDescriptionIDs'), classDescriptionIDs if classDescriptionIDs
			msg.add('ClassIDs'), classIDs if classIDs
			msg.add('StaffIDs'), staffIDs if staffIDs
			msg.add('StartDateTime'), startDate if startDate
			msg.add('endDateTime'), endDate if endDate
			msg.add('ClientID'), clientID if clientID
		end

		return response
	end		
end

