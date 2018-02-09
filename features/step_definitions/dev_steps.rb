require_relative "../lib/test_process"
require_relative"../lib/test_data"
require_relative "../lib/pages/side_menu"

And(/^I use the side menu$/) do
  SideMenu.new(false).sign_out
end

When(/^I run a step$/) do
  $log.info("Running a step")
end