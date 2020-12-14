class Character
   attr_accessor :charRace,:charClass, :menu, :main_menu, :charName

 def initialize
   @charName = charName
   @charRace = charRace
   @charClass = charClass
 end
# Create the folder to contain the Characters
def createFolder
   if Dir.exist?('../characters')
     Dir.chdir('../characters')
   else
     Dir.mkdir('../characters')
     Dir.chdir('../characters')
   end
end


   def init_file(_name)
      unless File.exist?("#{@charName}.csv")
        File.open("#{@charName}.csv", 'w') { |f| CSV.dump("#{@charName}", f) }
      end
    end

 def getCharName
   charName = $prompt.ask("Enter your Character's Name", default: "The Scaley Magus") do |q|
     q.required true
     q.modify   :up
     @charName = { Name: @charName.to_s }
      end
   end

 def createCharMenu
   clear
   createFolder
   getCharName
   
   selectRace
   clear
   selectClass
   clear
 end

 def exit_app
   clear
   puts 'Thank you for using D&D Character Builder'
   sleep 1
   clear
   exit
 end

end

