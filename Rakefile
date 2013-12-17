require 'rake/testtask'

task :default => [:test]
Rake::TestTask.new(:test) do |test|
  test.libs << 'test'

  # ensure the sample test file is included here
  test.test_files = FileList['test/test_*.rb']

  test.verbose = true
end