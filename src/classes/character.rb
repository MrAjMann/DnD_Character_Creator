require_relative '../methods/apiCall'

class Character
   attr_accessor :charRace, :charClass, :path, :menu, :mainMenu, :charName

 def initialize
   @path = path
   @charName = charName
   @charRace = charRace
   @charClass = charClass
 end

# Create the folder to contain the Characters
def createFolder
 @path =  TTY::File.create_dir("./characters")
  Dir::chdir("./characters")
  puts Dir::pwd 
  charList
end

#  Checks to see if a character File exists if so returns that file
def charList
  appWelcome
  @path = Dir.glob('*').join(', ').to_s
  if File.exist?(@path)
    clear
    appWelcome
    puts 'Select your character'
    charMenu = [
      { File.basename(@path, '.csv') => -> do mainMenu end },
      { 'Quit' => -> do exitApp end }
    ]
    $prompt.select('', charMenu)

    mainMenu
  else
    # If not character exists asks user to create one
    noCharacter
    clear
  end
end

def noCharacter
  clear
  appWelcome
  puts "Please Create a character\n"
  @menu = [
    { 'Create Character' => -> do createCharMenu end },
    { 'Quit' => -> do exitApp end }
  ]
  # system 'clear'
  $prompt.select('', @menu)
end

def charCreation
  puts HEADER_LINE
  puts 'Create your Character'.center(HEADER_LENGTH)
  puts HEADER_LINE
  puts
  self
end

   def getFile
      unless File.exist?("#{@charName}.csv")
        CSV.open("#{@charName}.csv", 'wb') do |csv|
        csv << ["Name","Race","Class"]
        csv << ["#{@charName}", "#{@charRace}", "#{@charClass}"]
        # data = CSV.parse(<<~ROWS, headers: true)
        # Name,Race,Class
        # @charName,@charRace,@charClass
      # ROWS
      end
    end
    end

    def createCharMenu
      appWelcome
      getCharInformation
    end

    # def writeData
    #   getFile
    #   CSV.open("#{@charName}.csv", 'wb') << ["#{charName}", "#{charRace}", "#{charClass}"]
    # end

 def getCharInformation
     @charName = $prompt.ask("Enter your Character's Name", default: "The Scaley Magus") do |q|
     q.required true
    #  q.modify   :up
    #  @charName = { Name: @charName.to_s }
  end
   selectRace
   selectClass
   getFile
  #  CSV.open("#{@charName}.csv", 'wb') << ["#{charName}", "#{charRace}", "#{charClass}"]

  # "@{charName}", "@{charRace}", "@{charClass}"
  #  writeData
      # init_file("#{@charName}.csv")
      # clear
      # puts "#{@charName}, Your Character has been created"
      # sleep 3
      # response = $prompt.yes?('View Character Now?')
      clear
      charList
   end
  
 def exitApp
   clear
   puts 'Thank you for using D&D Character Builder'
   sleep 1
   clear
   exit
 end

end

