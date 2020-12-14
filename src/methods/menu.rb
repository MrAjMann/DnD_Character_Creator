require 'tty-prompt'
$prompt = TTY::Prompt.new


def mainMenu
  clear
  appWelcome
end

  

  # def selectClassMenu
  #   prompt = TTY::Prompt.new
  #   prompt.select("Select Your Class",  getClasses)
  # end