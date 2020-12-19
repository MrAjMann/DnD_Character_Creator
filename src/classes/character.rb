require_relative '../methods/apiCall'
require 'csv'

=begin
Add a class for Races and Wizards
=end
class Character
   attr_accessor :charRace, :charClass, :path, :mainMenu, :charName

 def initialize
   @path = path
   @charName = charName
   @charRace = charRace
   @charClass = charClass
 end

 def charCreation
  puts HEADER_LINE
  puts 'Create your Character'.center(HEADER_LENGTH)
  puts HEADER_LINE
  puts
  self
  createFolder
end
# Create the folder to contain the Characters
def createFolder
 @path =  TTY::File.create_dir("./characters")
  Dir::chdir("./characters")
  puts Dir::pwd
  mainMenu
end

#  Checks to see if a character File exists if so returns that file

def mainMenu
  clear
  appWelcome
  puts "What you seek is just ahead"
  # puts "Welcome #{File.basename @path, '.csv'} to you Destiny: "
  @menu = [
    { 'Create A Character' => -> do createCharMenu end },
    { 'View Characters' => -> do selectChar end },
    # { 'Edit Characters' => -> do user_medications end },
    { 'Delete Character' => -> do deleteCharacter end },
    { 'Quit' => -> do exitApp end }
  ]
  $prompt.select('', @menu)
end

def noCharacter
  clear
  appWelcome
  puts "Please create a character"
  mainMenu
  $prompt.select('', mainMenu)
end


  def getFile
      unless File.exist?("#{@charName}.csv")
        data = CSV.parse(<<~ROWS, headers: true)
        Name,Race,Class
        #{@charName},#{@charRace},#{@charClass}
        ROWS
      CSV.open("#{@charName}.csv", 'wb') do |rows|
      rows << data
      puts data
      end
    end
  end

  # def readData
  #   unless File.exist?("#{@charName}.csv")
  #     @data = CSV.parse(<<~ROWS, headers: true)
  #   Name,Race,Class
  #   #{@charName},#{@charRace},#{@charClass}
  #   ROWS
  #   puts @data.first
  #   end
  # end
    def createCharMenu
      appWelcome
      getCharInformation
    end


 def getCharInformation
     @charName = $prompt.ask("Enter your Character's Name", default: "The Scaley Magus") do |q|
     q.required true
  end

   selectRace
   selectClass
   getFile
  #  sleep 1
  #  selectChar
   sleep 1
   mainMenu
   end


   def raceStats
    case 
      when @charRace === "Dragonborn"
        puts "You have selected the dragonborn"
        puts getCharRaceStats
        sleep 2
      when @charRace === "Dwarf"
        puts "You have selected the Dwarf"
        puts getCharRaceStats
        sleep 2
      when @charRace === "Elf"
        puts "You have selected the Elf"
        puts getCharRaceStats
        sleep 2
      when @charRace === "Gnome"
        puts "You have selected the Gnome"
        puts getCharRaceStats
        sleep 2
      when @charRace === "Half-Elf"
        puts "You have selected the Half-Elf"
        puts getCharRaceStats
        sleep 2
      when @charRace === "Half-Orc"
        puts "You have selected the Half-Orc"
        puts getCharRaceStats
        sleep 2
      when @charRace === "Halfling"
        puts "You have selected the Halfling"
        puts getCharRaceStats
        sleep 2
      when @charRace === "Human"
        puts "You have selected the Human"
           getCharRaceStats
        sleep 2
      when @charRace === "Tiefling"
        puts "You have selected the Tiefling"
        puts getCharRaceStats
        sleep 2
      else
        puts "This code isn't working"
      end
    end


   def classStats
    case 
      when @charClass === "Barbarian"
        puts "You have selected the barbarian"
         getCharClassStats
        sleep 2
      when @charClass == "Bard"
        puts "You have selected the bard"
            getCharClassStats
        sleep 2
      when @charClass === "Cleric"
        puts "You have selected the cleric"
         getCharClassStats
        sleep 2
      when @charClass == "Druid"
        puts"You have selected the druid"
         getCharClassStats
        sleep 2
      when @charClass == "Fighter"
        puts "You have selected the fighter"
         getCharClassStats
        sleep 2
      when @charClass == "Monk"
        puts "You have selected the monk"
         getCharClassStats
        sleep 2
      when @charClass == "Paladin"
        puts "You have selected the paladin"
         getCharClassStats
        sleep 2
      when @charClass == "Ranger"
        puts "You have selected the ranger"
         getCharClassStats
        sleep 2
      when @charClass == "Rogue"
        puts "You have selected the rogue"
         getCharClassStats
        sleep 2
      when @charClass == "Sorcerer"
        puts "You have selected the sorcerer"
         getCharClassStats
        sleep 2
      when @charClass == "Warlock"
        puts "You have selected the warlock"
         getCharClassStats
        sleep 2
      when @charClass == "Wizard"
        puts "You have selected the wizard"
         getCharClassStats
        sleep 2
      else
        puts "This code isn't working"
      end
    end

    def selectChar
      if Dir.empty?("./")
        puts "no character exist"
        sleep 2
        mainMenu
       else
       char = $prompt.select("Select a character", charList)
       array_of_hashmaps = CSV.read("#{char}", headers: true)
          p array_of_hashmaps# 1
        
      #  else
       end
      #  end
    end

def charList 
  charFiles = Dir.children( './' ) 
  # puts charFiles
  charFiles
end

  def deleteCharacter
    clear
    appWelcome
   if Dir.empty?("./")
    puts "no character exist"
    sleep 2
    mainMenu
   else
    puts "Select the character to delete"
    TTY::File.remove_file "#{selectChar}"
    clear
    mainMenu
  end
  end

 def exitApp
   clear
   puts 'Thank you for using D&D Character Builder'
   sleep 1
   clear
   exit
 end

end

