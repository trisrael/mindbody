# -*- coding: utf-8 -*-
class MBClassService < MBService
	extend MindbodyAPI

	on_create_document do |doc|
    	doc.alias MindbodyAPI::NS, MBClassService.get_api_namespace
	end

	endpoint :version => 1, :uri => "http://clients.mindbodyonline.com/api/0_5/ClassService.asmx"

	def get_classes(options = {})
		puts options
		return get_service("GetClasses", options)
	end

	def get_class_schedules(options = {})
		return get_service("GetClassSchedules", options)		
	end

	def get_class_descriptions(options = {})
		return get_service("GetClassDescriptions", options)
	end

end

