require_relative "./base_page"

class SignupPage < BasePage

  def initialize(wait_for_page = true)
    wait_for_load if wait_for_page
  end


  def click_login
    click(:xpath, "//md-toolbar//button")
  end

  def wait_for_load
    wait_for(:xpath, "//md-toolbar//button")
  end

end