Given /I have opened (.*) page/ do |ref|
  visit ui_url ref
end

Then /the page should contain (.*) text/ do |text|
  page.all('p').first().should have_content text
end