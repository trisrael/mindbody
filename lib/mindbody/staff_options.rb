class Mb::StaffOptions < Mb::Options
	attr_accessor :filters, :staff_ids

	#Return a hash ready for inclusion in a savon SOAP request, 
	#allow instance variables to renamed dependent on a map set up in the class
	def to_hash
		mapper = @map || {}
		 
		{ 
			mapper[:filters] || "Filters" => { "StaffFilter" =>  @filters}
			mapper[:staff_ids] || "StaffIDs" => { "int" =>  @staff_ids}
		}

	end
end
