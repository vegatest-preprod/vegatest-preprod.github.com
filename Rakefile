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
  # if this is a pull request, do a simple build of the site and stop
  if ENV['TRAVIS_PULL_REQUEST'].to_s.to_i > 0
    puts 'Pull request detected. Executing build only.'
    next
  end

  repo = %x(git config remote.origin.url).gsub(/^git:/, 'https:')
  system "git branch -v -a"
  system "git remote set-url --push origin #{repo}"
  system "git remote -v"
  system "git config user.name 'Travis-CI'"
  system "git config user.email 'vera_kruhliakova@epam.com'"
  puts "https://#{ENV['GH_TOKEN']}:@github.com"
  system 'git config credential.helper "store --file=.git/credentials"'
  File.open('.git/credentials', 'w') do |f|
    f.write("https://#{ENV['GH_TOKEN']}:@github.com")
  end
  system "git push origin HEAD:master"
  File.delete '.git/credentials'
end