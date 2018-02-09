require_relative "../lib/test_process"
require_relative"../lib/test_data"


When(/^I login to the Adepto Portal using email "([^"]*)" and password "([^"]*)"$/) do |username, password|
  TestProcess.open_url(TestData.start_url)
  TestProcess.login_to_portal(username, password)
end

Then(/^the "([^"]*)" page is displayed$/) do |page|
  TestProcess.verify_page_is_displayed(page)
end

When(/^I select the "([^"]*)" tab$/) do |tab|
  TestProcess.click_ribbon_tab(tab)
end

When(/^I click "([^"]*)" from the side navigation menu$/) do |item|
  TestProcess.click_side_nav_menu_item(item)
end

Then(/^I am logged out and at the signup page$/) do
  TestProcess.verify_page_is_displayed("signup")
end

And(/^I verify that the phone number displayed on the dashboard page is "([^"]*)"$/) do |phone_number|
  TestProcess.verify_dashboard_page_phone_number(phone_number)
end

Then(/^I verify that the "([^"]*)" shown on the Tools tab has "([^"]*)"$/) do |tool_tab, item|
  TestProcess.verify_tools_page_item_contents(tool_tab, item)
end

And(/^perform a search for "([^"]*)"$/) do |search_item|
  TestProcess.search_for(search_item)
end

Then(/^I verify that "([^"]*)" is included in the search results$/) do |search_item|
  TestProcess.verify_item_included_in_search_results(search_item)
end