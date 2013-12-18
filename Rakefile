require 'rake/testtask'

ENV["SITE_URL"] = "http://localhost:4000"

task :default => [:test]

Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.test_files = FileList['test/test_*.rb']
  test.verbose = true
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
