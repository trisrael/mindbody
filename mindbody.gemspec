lib = File.expand_path("../lib", __FILE__)
$:.unshift lib unless $:.include? lib

require "mindbody/version"

Gem::Specification.new do |s|
  s.name = "mindbody"
  s.version = Mindbody::Version
  s.authors = "Tristan Goffman"
  s.email = "tgoffman@gmail.com"
  s.homepage = "http://github.com/trisrael/mindbody"
  s.summary = "Ruby interface to Mindbody 0.5 API"
  s.description = "Ruby's interface to the Mindbody 0.5 API with no bell's and whistles"

  s.rubyforge_project = s.name

  s.add_dependency "savon", "~> 0.9.2"
  s.files = `git ls-files`.split("\n")
  s.require_path = "lib"
end


