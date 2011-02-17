# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fake/version"

Gem::Specification.new do |s|
  s.name        = "fake"
  s.version     = Fake::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Piotr Zolnierek"]
  s.email       = ["pzolnierek@gmail.com"]
  s.homepage    = "http://github.com/pzol/fake"
  s.summary     = %q{Fake helps creating fakes or in other word stubs}
  s.description = %q{It creates an BasicObject and lets you define your method calls returning the predefined values}

  s.rubyforge_project = "fake"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  # s.add_dependency "activesupport", ">=3.0.3"
end
