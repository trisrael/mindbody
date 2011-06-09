class LocWsdlDocService < Mb::Service
	endpoint File.expand_path("../ClassService.asmx", __FILE__)
end
