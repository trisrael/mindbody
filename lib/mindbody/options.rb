module Mb
	class Options
		class << self; attr_accessor :map; end

		#A map describing how the local private instance variables should show for public services
		def self.public_var_names(soap_names_map)
			@map = soap_names_map
		end	

		def self.map
			@map
		end

		#Check that a variable is an Array, if not turn it into one
		#If a symbol is given as a second option, assume the sym is the name of a instance variable, send the instance_variable to value of its new attr (Array)
		#NOTE: Should not give sym as option if defining the attribute method for the same name attribute, will cause infinite loop. Mostly this option is for use
		#within initialize method
		def arrayify(arr, attr_sym = nil)
			begin
				arr.count #Is this an array?
			rescue
				arr = [arr]
			end		
		
			attr_sym ? send(attr_sym.to_s + "=", arr) : arr
		end

	end
end
