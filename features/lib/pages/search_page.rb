require_relative "./base_page"

class SearchPage < BasePage
  def initialize(wait_for_page = true)
    wait_for_load if wait_for_page
  end

  def wait_for_load
    wait_for(:xpath, "//input[contains(@ng-model,'ctrl.queryParams.query')]")
    #wait_for(:xpath, get_nav_button_xpath("›"))
  end

  def search_for(item)
    $log.debug("Search for " + item.to_s)
    set_text_field(:xpath, "//input[contains(@ng-model,'ctrl.queryParams.query')]", item)
    click_search
  end

  def search_item_exists?(search_item)
    # Assume search_item is the name displayed
    item_xpath = "//div[contains(@class,'search-result layout-row')]//div[contains(@class,'md-title')and contains(text(),'" + search_item + "')]"
    $log.debug("Search item xpath: " + item_xpath)
    return element_visible(:xpath, item_xpath)
  end


  def click_page(page_num)
    get_navigation_page(page_num.to_s).click
  end


  #Return true if currently on the last page, false otherwise
  def click_next
    btn = get_navigation_button("›")
    $log.debug("Got next nav button to_s: " + btn.to_s)
    $log.debug("Got next nav button parent class: " + btn.parent.class_name.to_s)
    return true if btn.parent.class_name.include? "disabled"
    btn.click
    wait_for(:xpath, get_nav_button_xpath("›"))
    return false
  end

  def click_previous
    btn = get_navigation_button("‹")
    $log.debug("Got next nav button parent class: " + btn.parent.class_name.to_s)
    return true if btn.parent.class_name.include? "disabled"
    btn.click
    wait_for(:xpath, get_nav_button_xpath("›"))
    return false
  end

  def get_navigation_button(direction)
    get_element(:xpath, get_nav_button_xpath(direction))
  end

  def get_navigation_page(page_num)
    get_element(:xpath, "//a[contains(text(),'" + page_num + "')]")
  end

  def get_nav_button_xpath(direction)
    return "//a[contains(text(),'" + direction + "')]"
  end

  def click_search
    get_elements(:xpath, "//button[contains(text(),'Search')]").first.click
    wait_for(:xpath, get_nav_button_xpath("›"))
  end
end