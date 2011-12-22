base = 'lib/mindbody/'

['meta', 'options', 'credentials', 'source_credentials', 'service', 'site_service'].each do |str|
		load (base + str + '.rb')
end
