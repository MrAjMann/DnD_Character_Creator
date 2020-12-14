HEADER_LINE = "-------------------------------------------------------------------------------------------------------------------"
HEADER_LENGTH = HEADER_LINE.length



def appWelcome
  font = TTY::Font.new(:standard)
  pastel = Pastel.new
  clear
  puts HEADER_LINE
  puts pastel.bright_white(font.write("D&D")).center(HEADER_LENGTH)
  puts pastel.blue(font.write("Character Builder")).center(HEADER_LENGTH)
  puts HEADER_LINE
  puts
end



