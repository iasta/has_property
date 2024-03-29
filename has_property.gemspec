# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "has_property/version"

Gem::Specification.new do |s|
  s.name        = "has_property"
  s.version     = HasProperty::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Moses Dwaram"]
  s.email       = ["mdwaram@iasta.com"]
  s.homepage    = ""
  s.summary     = %q{"has_property gem"}
  s.description = %q{"Gem to define custom property behavior"}

  s.rubyforge_project = "has_property"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
