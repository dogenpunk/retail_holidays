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

  s.test_files    = %w(spec/date_spec.rb
                       spec/retail_holidays_spec.rb
                       spec/spec_helper.rb)
  s.require_paths = ["lib"]
  s.files         = %w(Gemfile
                       README.md
                       Rakefile
                       TODO.md
                       lib/retail_holidays.rb
                       lib/retail_holidays/version.rb
                       retail_holidays.gemspec)

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
end
