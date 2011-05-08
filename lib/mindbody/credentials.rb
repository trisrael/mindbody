class Credentials
	attr_accessor :name, :password, :ids

	#A map describing how the local private instance variables should show for public services
	def self.public_var_names (soap_names_map)
		@@map =  soap_names_map
	end
	  
	def initialize(name, password, ids)
		 @name = name
		 @password = password

		begin
			ids.count #Is this an array?
		rescue
			ids = [ids]
		end		
				
		@ids = ids
	end

	#Return a hash ready for inclusion in a savon SOAP request, 
	#allow instance variables to renamed dependent on a map set up in the class
	def to_hash
		mapper = @@map || {}
		 
		{ 
			mapper[:name] || "Name"  => @name,
			 
			mapper[:password]  || "Password" => @password,
			
			mapper[:ids] || "Ids" => { "int" =>  @ids}
		}

	end
end
