=begin

D&D Character Builder V1.0 
Built by Anthony Mann 2020

=end
require_relative './classes/character'
require_relative './methods/headers'
require_relative './methods/menu'
require_relative './methods/apiCall'
require 'tty-file'
require 'tty-prompt'
require 'tty-font'
require 'pastel'
require 'json'
require 'csv'


def clear
    puts "\e[2J\e[f"
end

character = Character.new
character.createFolder
# font = TTY::Font.new(:standard)
# pastel = Pastel.new

# puts font.write("D&D" + " Character" + " Builder")
# puts font.write("Character")
# puts font.write("Builder")

