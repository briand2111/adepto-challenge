require_relative "./base_page"

class ToolsPage < BasePage
  def initialize(wait_for_page = true)
    #wait_for(:xpath, "//div[contains(@ui-view,'profile-component')]//div[contains(@class,'md-display-2') and contains(text(),'Tools')]") if wait_for_page
  end

  def click_empty_tool_section(section)
    section_xpath = "//md-list-item//h2[contains(@class,'ng-binding') and contains(text()'List the " + section.to_s.downcase + " you bring to the job')]"
    $log.debug "ToolsPage: Got empty tool section xpath: " + section_xpath
    click(:xpath,section_xpath)
  end

  def verify_tab_item(tool_tab, item)
    raise "Item '" + item +"' not in listed " + tool_tab unless get_tab_item_list(tool_tab, 0).include?(item.to_s)
    $log.info("Item '" + item +"' found in listed " + tool_tab)
  end

  # TODO Returns items displayed in all tool tabs - need to restrict to specific one
  def get_tab_item_list(tool_tab, attempt)
    begin
      r = []
      get_list_item(tool_tab).elements(:xpath, "//li/span[contains(@class,'ng-binding')]").to_a.each {|elem|
        r.push elem.text.to_s
      }
      $log.debug "Got listed software: " + r.to_s
      return r
    rescue Exception => e
      raise "Failed to get tab item list: " + e.message if attempt > 10
      $log.debug "Attempt " + attempt.to_s + "Failed to get tab item list: " + e.message
      sleep(2)
      get_tab_item_list(tool_tab, attempt+=1)
    end

  end


  def get_list_item(item_name)
    $log.debug "Getting tools list item " + item_name
    populated_item_xpath = "//div[contains(@class,'md-headline') and contains(text(),'" + item_name + "')]/../.."
    unpopulated_item_xpath = "//h1[contains(@class,'md-headline') and contains(text(),'" + item_name + "')]/../.."

    list_item = nil
    [populated_item_xpath, unpopulated_item_xpath].each do | xpath |
      $log.debug("Trying xpath: " + xpath)
      list_item = get_element(:xpath, xpath)
      break unless list_item.nil?
      $log.debug("Not found")
    end

    $log.debug ("got list item: " + list_item.to_s)
    return list_item
  end
end