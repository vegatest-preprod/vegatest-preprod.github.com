require 'rake/testtask'

ENV["SITE_URL"] = "http://localhost:4000"

task :default => [:test]

task :test => [:unit_test, :integration_test]

Rake::TestTask.new(:unit_test) do |test|
  test.libs << 'test'
  test.test_files = FileList['test/test_*.rb']
  test.verbose = true
end

task :integration_test do
  sh "cucumber test"
end

task :jekyll do
  sh "jekyll serve --detach"
end

task :local => [:jekyll]

task :remote do
  file = File.open("CNAME", "r")
  ENV["SITE_URL"] = "http://" + file.read.gsub!(/\s+/, "")
  file.close
end
