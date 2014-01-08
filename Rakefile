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
    sh "gem install jekyll; jekyll serve --detach"
  end
end

desc 'Publish site to GitHub Pages'
task :deploy do
  source_branch = 'dev'
  deploy_branch = 'master'
  
  if ENV['TRAVIS_TEST_RESULT'].to_i != 0
    puts "Skipping deployment due to test failure"
    next
  end
  
  if ENV['TRAVIS_PULL_REQUEST'] == "true" and ENV['TRAVIS_BRANCH'] != source_branch
    puts "Skipping deployment from #{ENV['TRAVIS_BRANCH']}"
    next
  end
  
  repo = %x(git config remote.origin.url).gsub(/^git:/, 'https:')
  system "git remote set-url --push origin #{repo}"
  system 'git config credential.helper "store --file=.git/credentials"'
  File.open('.git/credentials', 'w') do |f|
    f.write("https://#{ENV['GH_TOKEN']}:x-oauth-basic@github.com")
  end
  
  puts "Deploying from #{source_branch} to #{deploy_branch}"
  deployed = system "git push origin #{source_branch}:#{deploy_branch}"
  puts "Deployed: #{deployed}"
  
  File.delete '.git/credentials'
  
  if not deployed
    exit -1
  end
end