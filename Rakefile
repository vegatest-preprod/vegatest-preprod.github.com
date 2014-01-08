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
  if ENV['TRAVIS_PULL_REQUEST'] == "false" and ENV['TRAVIS_BRANCH'] == "dev"
      sh "git checkout #{ENV['TRAVIS_BRANCH']}"
      sh "git branch -v -r"
      repo = %x(git config remote.origin.url).gsub(/^git:/, 'https:')
      sh "git remote set-url --push origin #{repo}"
      sh "git config user.name '#{ENV['GIT_NAME']}'"
      sh "git config user.email '#{ENV['GIT_EMAIL']}'"
      sh 'git config credential.helper "store --file=.git/credentials"'
      File.open('.git/credentials', 'w') do |f|
        f.write("https://#{ENV['GH_TOKEN']}:x-oauth-basic@github.com")
      end
      sh "git push origin HEAD:master"
      File.delete '.git/credentials'
  end
end