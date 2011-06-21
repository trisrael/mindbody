module Mb
	class StaffService < Service
		local_document "../wsdl/staff.xml"
	
		def options=(arr = [])
			@arr = arr
			@arr = [@arr] if @arr.class != Array
			validate
		end

		def options
			@arr
		end

		def validate
			@arr.each {|ent| throw TypeError.new "Expected entry to be of type #{StaffOptions.to_s}, but was of type #{ent.class.to_s}" if ent.class != StaffOptions}
		end

	end
end
