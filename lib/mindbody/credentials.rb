module Mb
	class Credentials < Options
		attr_accessor :name, :password, :ids

		#Allow for Credentials.new to be used... and set at later 
		def initialize(name = nil, password = nil, ids = [])
			@name = name
			@password = password
			arrayify ids, :ids	
		end

		#Return a hash ready for inclusion in a savon SOAP request, 
		#allow instance variables to renamed dependent on a map set up in the class
		def to_hash

			mapper = self.class.map || {}

			{ 
				mapper[:name] || "Name"  => @name,
				 
				mapper[:password]  || "Password" => @password,
			
				mapper[:ids] || "Ids" => { "int" =>  @ids}
			}

		end
	end
end
