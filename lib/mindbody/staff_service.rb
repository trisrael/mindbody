class Mb::StaffService < Mb::Service
	service "StaffService"
	
	def options=(arr = [])
		@arr = arr
		@arr = [@arr] if @arr.class != Array
		validate
	end

	def validate
		arr.each {|ent| throw TypeError.new "Expected entry to be of type #{StaffOptions.to_s}, but was of type #{ent.class.to_s}" if ent.class != StaffOptions}
	end

	def build_request(opts = {})
		to_ret = super opts
		arr.each {|ent| to_ret.deep_merge ent.to_hash}		
		to_ret
	end

end
