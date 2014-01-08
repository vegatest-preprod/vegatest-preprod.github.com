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
  if ENV['TRAVIS_PULL_REQUEST'] == "false" and ENV['TRAVIS_BRANCH'] == source_branch
      repo = %x(git config remote.origin.url).gsub(/^git:/, 'https:')
      sh "git remote set-url --push origin #{repo}"
      sh 'git config credential.helper "store --file=.git/credentials"'
      sh "echo https://#{ENV['GH_TOKEN']}:x-oauth-basic@github.com > .git/credentials"
      sh "git push origin #{source_branch}:#{deploy_branch}"
      File.delete '.git/credentials'
  end
end