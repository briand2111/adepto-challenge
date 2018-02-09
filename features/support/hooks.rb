require 'watir'

Before do
  # Restart the browser for each test scenario
  $log.info("Starting new scenario")
  $browser = Watir::Browser.new
  $browser.driver.manage.window.maximize
end

After do
  #Close the browser after each test scenario
  $browser.close
  sleep(10)
  $log.info("Completed scenario")
end