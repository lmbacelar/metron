Given /^I have no "([^"]*)"/ do |model|
  model.singularize.capitalize.constantize.delete_all
end

Given /^the following "([^"]*)" exist:$/ do |resource, table|
  table.hashes.each do |hash|
    resource.classify.constantize.create hash
  end    
end

Given /^I am on the new "([^"]*)" page$/ do |resource|
  visit "/#{resource.tableize}/new"
end



When /^I visit the "([^"]*)" page$/ do |resource|
  visit "/#{resource.tableize}"
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, with: value)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end


Then /^I should have (\d+) "(.*)"$/ do |count, model|
  expect(model.singularize.capitalize.constantize.count).to eq count.to_i
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  expect(page).to have_content(text)
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  expect(page).to have_no_content(text)
end

Then /^(?:|I )should see \/([^\/]*)\/$/ do |regexp|
  expect(page).to have_xpath('//*', text: Regexp.new(regexp)) 
end

Then /^I should see "([^"]*)" before "([^"]*)"$/ do |text1, text2|
  expect(page.body).to match /#{Regexp.quote(text1)}.*#{Regexp.quote(text2)}/m
end

Then /^I should see one "([^"]*)" link$/ do |link_text|
  expect(page.body).to have_css('a', text: link_text, count: 1)
end

Then /^(?:|I )should be on the "([^"]*)" page$/ do |resource|
  target_path = "/#{resource.tableize}"
  expect(current_path).to eq target_path
end

Then /^I should be on the new "([^"]*)" page$/  do |resource|
  target_path = "/#{resource.tableize}/new"
  expect(current_path).to eq target_path
end

Then /^I should be on the page of "([^"]*)" with "([^"]*)" "([^"]*)"$/ do |resource, attribute, value|
  resource_id = resource.classify.constantize.find_by(attribute.downcase => value).id
  target_path = "/#{resource.tableize}/#{resource_id}"
  expect(current_path).to eq target_path
end
