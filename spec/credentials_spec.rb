require "spec_helper.rb"

class TestOpts < Mb::Credentials
	public_var_names :name => "TestName"
end

describe Mb::Credentials do

	describe "#mapper" do		

		it "should allow subclasses to rewrite the outputted names" do
			opts = TestOpts.new("name", "password", 1)
			opts.to_hash["TestName"].should_not be_nil
		end

	end


end
