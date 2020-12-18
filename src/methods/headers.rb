HEADER_LINE = "----------------------------------------"
HEADER_LENGTH = HEADER_LINE.length



def appWelcome
  font = TTY::Font.new(:standard)
  pastel = Pastel.new
  clear
  puts HEADER_LINE
  puts pastel.bright_white("𝔇𝔲𝔫𝔤𝔢𝔬𝔫𝔰 &̵ 𝔇𝔯𝔞𝔤𝔬𝔫𝔰").center(HEADER_LENGTH)
  puts pastel.blue("𝙲𝚑𝚊𝚛𝚊𝚌𝚝𝚎𝚛 𝙱𝚞𝚒𝚕𝚍𝚎𝚛").center(HEADER_LENGTH)
  puts HEADER_LINE
  puts
end



