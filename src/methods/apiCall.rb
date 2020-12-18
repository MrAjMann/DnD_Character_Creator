require 'faraday'
require 'uri'
# require 'tts'
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
raceStats
end


def selectClass
  @charClass = $prompt.select("Select Your Class",  getClasses, per_page: 12)
  classStats
end

def getCharRaceStats
  param = "#{@charRace}".downcase
 url =('https://www.dnd5eapi.co/api/races/'+ "#{param}")
 puts url
  conn = Faraday.get(url)
    parsed = JSON.parse(conn.body)  
    # parsed["ability_score"].map do |statResult|
      parsed["alignment"] do |result|
      @charRaceStats = result
      @charRaceStats
    end
  end

  
def getCharClassStats
  param = "#{@charClass}".downcase
 url =('https://www.dnd5eapi.co/api/classes/'+ "#{param}")
 puts url
  conn = Faraday.get(url)
    parsed = JSON.parse(conn.body)  
    parsed["proficiency_choices"].map do |statResult|
      statResult["from"].map do |result|
      @charClassStats = result["index"]
        puts @charClassStats
    end
    end
  end