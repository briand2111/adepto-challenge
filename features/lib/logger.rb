class Log

  def initialize

  end

  def write_msg(msg)
    puts msg
  end

  def error(msg)
    write_msg("Error: " + msg)
  end

  def info(msg)
    write_msg("Info: " + msg)
  end

  def debug(msg)
    write_msg("Debug: " + msg)
  end



end