class Mb::Options
    class << self; attr_accessor :map; end

	#A map describing how the local private instance variables should show for public services
	def self.public_var_names (soap_names_map)
		@map = soap_names_map
	end	

end
