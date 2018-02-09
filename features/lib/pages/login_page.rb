require_relative "./base_page"

class LoginPage < BasePage

  def initialize(wait_for_page = true)
    wait_for(:name, "username") if wait_for_page
  end

  def login(username, password)
    $log.info "Logging in as: " + username + " - " + password
    set_text_field(:name, "username", username)
    set_text_field(:name, "password", password)
    click(:xpath, "//div[contains(@class, registration-form)]//button[contains(text(), 'Log in')]")
  end
end