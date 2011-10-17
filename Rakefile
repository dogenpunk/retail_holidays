require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

desc "Open an irb console preloaded with RetailHolidays"
task :console do
  sh "irb -rubygems -I lib -r retail_holidays.rb"
end

task :default => :spec
