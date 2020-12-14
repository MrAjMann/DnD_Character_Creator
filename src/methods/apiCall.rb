require 'faraday'
require 'json'

def getRaces
  conn = Faraday.get('https://www.dnd5eapi.co/api/races')
    parsed = JSON.parse(conn.body)  
    parsed["results"].map do |result|
      charRace = result["name"]     
        charRace
    end
  end

def getClasses
conn = Faraday.get('https://www.dnd5eapi.co/api/classes')
  parsed = JSON.parse(conn.body)  
  parsed["results"].map do |result|
    charClass = result["name"]     
      charClass
  end
end

def selectRace
  prompt = TTY::Prompt.new
  prompt.select("Select Your Race",  getRaces, per_page: 12 )
end

def selectClass
  prompt = TTY::Prompt.new
  prompt.select("Select Your Class",  getClasses, per_page: 12)
end

