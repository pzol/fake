require 'rake/testtask'

Rake::TestTask.new(:test) do |test|
  test.pattern = 'test/**/*_test.rb'
	test.libs << ["test", "lib"]
  test.verbose = true
end
