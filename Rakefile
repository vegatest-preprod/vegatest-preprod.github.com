require 'rake/testtask'

ENV["SITE_URL"] = "http://localhost:4000"

task :default => [:test]

task :test => ['test:unit', 'test:acceptance']

namespace 'test' do

  Rake::TestTask.new('unit') do |test|
    test.libs << 'test'
    test.test_files = FileList['test/test_*.rb']
    test.verbose = true
  end

  task :acceptance do
    sh "cucumber test"
  end

end

task :jekyll do
  if ENV["REMOTE"] == 'true'
    file = File.open("CNAME")
    ENV["SITE_URL"] = "http://" + file.read.gsub(/\s+/, "")
    file.close
  else
    sh "jekyll serve --detach"
  end
end
