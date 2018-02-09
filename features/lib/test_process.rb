require_relative "pages/signup_page"
require_relative "pages/login_page"
require_relative "pages/header_ribbon"
require_relative "pages/tools_page"
require_relative "pages/side_menu"
require_relative "pages/search_page"

module TestProcess

  def self.open_url(url)
    $browser.goto(url)
  end

  def self.login_to_portal(username, password)
    SignupPage.new.click_login
    LoginPage.new.login(username, password)
    HeaderRibbon.new.wait_for_load
  end

  def self.verify_page_is_displayed(page)
    case page.to_s.downcase
      when "dashboard"
        p = HeaderRibbon.new(false)
      when "signup"
        p = SignupPage.new(false)
      else
        raise "Page " + page.to_s + " is not known"
    end

    $log.debug("Waiting for page " + page + " to load")
    p.wait_for_load
    $log.info("Page " + page + " loaded successfully")
  end

  def self.click_ribbon_tab(tab)
    HeaderRibbon.new.click_tab(tab)
  end

  def self.verify_dashboard_page_phone_number(phone_number)
    HeaderRibbon.new.verify_phone_number_is(phone_number)
  end

  def self.verify_tools_page_item_contents(tool_tab, item)
    ToolsPage.new.verify_tab_item(tool_tab, item)
  end

  def self.click_side_nav_menu_item(item)
    SideMenu.new(false).click_menu_item(item)
  end

  def self.search_for(search_item)
    SearchPage.new.search_for(search_item)
  end

  def self.verify_item_included_in_search_results(search_item)
    $log.info("Verifying that item " + search_item + " is displayed in the search results")
    # TODO Ensure things start on page 1??
    found = false
    on_last_page = false

    while ! found && ! on_last_page
      sleep(1)
      found = SearchPage.new.search_item_exists?(search_item)
      $log.debug("Found " + search_item + " on page: " + found.to_s)
      break if found

      $log.debug("Not found")
      #Click next
      on_last_page = SearchPage.new.click_next
    end

    raise "Search item " + search_item + " not found" if ! found && on_last_page
    $log.info("Search item " + search_item + " found")
  end
end