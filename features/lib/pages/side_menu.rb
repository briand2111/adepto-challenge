require_relative "./base_page"

class SideMenu < BasePage

  #@btn_class = {
  #    :account => "pendo-account",
  #    :search => "pendo-search",
  #    :sign_out => "pendo-signout"
  #}

  def initialize(wait_for_page = true)
    wait_for_load if wait_for_page
  end

  def wait_for_load
    wait_for(:xpath, "//ul[contains(@class,'sidenavMenu')]")
  end

  def click_menu_button(btn_class)
    btns = get_side_menu_buttons.select { |btn|
      $log.debug("got button: " + btn.class_name)
      btn.class_name.to_s.include? btn_class
    }
    $log.debug("Got buttons: " + btns.to_s)
    btns.last.click
  end
  def sign_out
    $log.debug("Clicking sign_out")
    click_menu_button("pendo-signout")
  end
  alias_method :logout, :sign_out

  def search
    $log.debug("Clicking search")
    click_menu_button("pendo-search")
  end

  def get_side_menu_buttons
    get_side_menu.buttons(:xpath, "//button[contains(@class,'md-button')]").to_a
  end

  def get_side_menu
    menu_xpath = "//ul[contains(@class,'sidenavMenu')]"
    get_elements(:xpath, menu_xpath).last
  end

  def click_menu_item(item)
    $log.debug("Clicking menu item " + item)
    case item.to_s.downcase
      when "sign out"
        sign_out
      when "search"
        search
      else
        raise "Don't know about menu item " + item
    end
  end
end