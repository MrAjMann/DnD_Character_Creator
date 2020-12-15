require 'tty-prompt'
$prompt = TTY::Prompt.new


def mainMenu
  clear
  appWelcome
  puts "Welcome #{File.basename @path, '.csv'} Please Select your Character: "
  @menu = [
    { 'Create A Character' => -> do createCharMenu end },
    # { 'View Characters' => -> do user_medications end },
    # { 'Edit Characters' => -> do user_medications end },
    # { 'Delete Characters' => -> do user_medications end },
    { 'Quit' => -> do exit_app end }
  ]
  $prompt.select('', @menu)
end

    

  # def selectClassMenu
  #   prompt = TTY::Prompt.new
  #   prompt.select("Select Your Class",  getClasses)
  # end