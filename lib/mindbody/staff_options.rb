module Mb
	class StaffOptions < Options
		attr_accessor :filters, :staff_ids		

		def staff_ids=(arr = nil)
			@staff_ids = arrayify(arr)
		end

		#Return a hash ready for inclusion in a savon SOAP request, 
		#allow instance variables to renamed dependent on a map set up in the class
		def to_hash
			mapper = self.class.map || {}			 

			to_ret = {}
			to_ret[ mapper[:filters] || "Filters" ]= { "StaffFilter" =>  @filters} if @filters
			to_ret[ mapper[:staff_ids] || "StaffIDs" ]= { "int" =>  @staff_ids} if @staff_ids
			to_ret
		end
	end
end
