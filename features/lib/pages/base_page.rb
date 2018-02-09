
class BasePage

  def wait_for_load
    #Need to implement in extending class
    raise "wait_for_load method not defined for page class"
  end


  def wait_for(loc_sym, loc_val)
    $log.debug "waiting for: " + loc_sym.to_s + " = " + loc_val.to_s
    start_time = Time.now

    # Give up after 30 seconds
    i = 0
    while ! element_visible(loc_sym, loc_val) && i < 30
      $log.debug "Attempt " + i.to_s + " Element " + loc_sym.to_s + " = " + loc_val.to_s + " not visible yet"
      sleep(1)
      i+=1
    end

    if element_visible(loc_sym, loc_val)
      $log.debug("Found it after: " + i.to_s + " attempts. Time taken: " + (Time.now - start_time).to_s)
    else
      raise "Element " + loc_sym.to_s + " = " + loc_val.to_s + " not visible after 30 seconds"
    end

  end

  def set_text_field(loc_sym, loc_val, value)
    $browser.text_field(loc_sym, loc_val).set value
  end

  def get_text(loc_sym, loc_val)
    return $browser.element(loc_sym, loc_val).text
  end

  def click(loc_sym, loc_val)
    $browser.element(loc_sym,loc_val).click
  end

  def element_visible(loc_sym, loc_val)
    begin
      return get_element(loc_sym, loc_val).visible?
    rescue Exception => e
      $log.debug "Exception checking if element visible: " + e.message.to_s
      return false
    end
  end

  def get_element_text(loc_sym, loc_val)
    element = get_element(loc_sym, loc_val)
    return element.text unless element.nil?
    raise "Unable to get text from element: loc_sym='" + loc_sym + "' and loc_val='" +loc_val + "' not found"
  end

  def get_element(loc_sym, loc_val)
    begin
      return $browser.element(loc_sym, loc_val)
    rescue Exception => e
      $log.debug "Exception getting element: loc_sym='" + loc_sym + "' and loc_val='" +loc_val + " " + e.message.to_s
      return nil
    end
  end

  # Return an array of elements
  def get_elements(loc_sym, loc_val)
    begin
      return $browser.elements(loc_sym, loc_val).to_a
    rescue
      $log.debug("Element(s): loc_sym='" + loc_sym + "' and loc_val='" +loc_val + "' not found")
      return []
    end
  end

  def wait_for_load
    raise "Implement wait_for_load method"
  end
end