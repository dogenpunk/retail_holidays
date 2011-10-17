# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "retail_holidays/version"

Gem::Specification.new do |s|
  s.name        = "retail_holidays"
  s.version     = RetailHolidays::VERSION
  s.authors     = ["dogenpunk"]
  s.email       = ["dogenpunk@gmail.com"]
  s.homepage    = "https://github.com/dogenpunk/retail_holidays"
  s.summary     = %q{Need a holiday? A SHOPPING HOLIDAY?}
  s.description = %q{A mixin to determine if a specific date falls on a North American retail holiday. Written for APS's ARC}

  s.rubyforge_project = "retail_holidays"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
end
