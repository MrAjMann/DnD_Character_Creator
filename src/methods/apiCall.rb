require 'faraday'
require 'json'
require 'tty-prompt'
require_relative '../classes/character'
$prompt = TTY::Prompt.new
def getRaces
  conn = Faraday.get('https://www.dnd5eapi.co/api/races')
    parsed = JSON.parse(conn.body)  
    parsed["results"].map do |result|
      @charRace = result["name"]     
        @charRace
    end
  end

def getClasses
conn = Faraday.get('https://www.dnd5eapi.co/api/classes')
  parsed = JSON.parse(conn.body)  
  parsed["results"].map do |result|
    @charClass = result["name"]     
      @charClass
  end
end

def selectRace
@charRace = $prompt.select("Select Your Race",  getRaces, per_page: 12 )
  
end


def selectClass
  @charClass = $prompt.select("Select Your Class",  getClasses, per_page: 12)
  puts @charClass
end

