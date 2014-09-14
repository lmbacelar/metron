Given /^I have no "([^"]*)"/ do |model|
  model.singularize.capitalize.constantize.delete_all
end

Given /^the following "([^"]*)" exist:$/ do |resource, table|
  table.hashes.each do |hash|
    resource.classify.constantize.create hash
  end    
end

When /^I visit the "([^"]*)" page$/ do |resource|
  visit "/#{resource.tableize}"
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  expect(page).to have_content(text)
end

Then /^I should see "([^"]*)" before "([^"]*)"$/ do |text1, text2|
  expect(page.body).to match /#{Regexp.quote(text1)}.*#{Regexp.quote(text2)}/m
end

Then /^I should see one "([^"]*)" link$/ do |link_text|
  expect(page.body).to have_css('a', text: link_text, count: 1)
end
