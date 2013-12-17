require 'rake/testtask'

task :default => [:test]

Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.test_files = FileList['test/test_*.rb']
  test.verbose = true
end

task :jekyll do
  sh "jekyll serve --detach"
end
