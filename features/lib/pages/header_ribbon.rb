require_relative "./base_page"
require_relative "../test_data"

class HeaderRibbon < BasePage

  def initialize(wait_for_page = true)
    wait_for_load if wait_for_page
  end

  def wait_for_load
    #Wait for the "GENERAL" link on the nav-bar is displayed
    wait_for(:xpath, "//div[@class='md-nav-bar']//a[contains(@href,'general')]")
  end

  def click_tab(tab)
    begin
      tab_xpath = "//div[@class='md-nav-bar']//a[contains(@href,'" + tab.to_s.downcase + "')]"
      $log.debug("Clicking tab with xpath: " + tab_xpath)
      click(:xpath, tab_xpath)
    rescue Exception => e
      raise "Failed to click tab: '" + tab + "' - "+ e.message
    end

  end

  def verify_phone_number_is(phone_number)
    # Check for:
    #  - displayed phone number matches
    #  - href = 'tel:<CountryCode>phone_number'
    $log.info "Verifying phone number displayed is '" + phone_number + "'"
    raise "Phone number doesn't match: Displayed number = '" + displayed_phone_number + "' Expected number: '" + phone_number + "'" unless phone_number.to_s == displayed_phone_number.to_s

    expected_href = "tel:" + TestData.country_phone_code + phone_number.to_s.delete(" ")
    raise "Phone href value not set correctly: Displayed value: '" + get_phone_number_element.href.to_s + "' Expected value: '" + expected_href  unless get_phone_number_element.href.to_s == expected_href
    $log.info("Phone number displayed as expected")
  end

  def displayed_phone_number
    return get_phone_number_element.text
  end

  def get_phone_number_element
    #  - class containing 'metrics-phone-link and md-accent'
    return $browser.a(:xpath, "//a[contains(@class, 'metrics-phone-link') and contains(@class, 'md-accent')]")
  end
end