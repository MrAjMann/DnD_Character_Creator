# T1A3 D&D Character Creator

Design and Developed by Anthony Mann.

## <!-- This application is in early stages of development and not all features are available. -->

<https://trello.com/b/tU7B2Cxo/ddcharactercreationapp>

## Software Development Plan

### Statement of Purpose

**Description:**
This application is designed to help players of Dungeons and Dragons (D&D) create the story Characters. I wish to also provide quality information as to the pro's and cons of each Race,Class,Ability Scores and Equipment.

**The problem:**
The creation of D&D characters can often be a tedious process as there is many variables at play. This application is designed to take the guess work out of character creation and let the player focus on the creative aspect.

**Target Audience:**
My targeted user base is those interested in Dungeons and Dragons, players of all ages and skill levels.

**How To Use:**
As you start the application you will be greeted with a starting menu. This menu will display the options to _Create A New Character_, _View an Existing Character_, _Edit a Character_ and _Delete a Character_.

### Features

**API Integration:**
Access the ["D&D API"](https://www.dnd5eapi.co/api) to get Multiple streams of information based on where the user is in the character creation process. E.g the first API call is to retrieve a list of **Races**. E.g Druid, Tiefling, Human etc.
The second API call is for **Classes** E.g Warlock, Sorcerer, barbarian etc. Once the mvp is completed for the App then i want to add further calls to provide more information and allow further expansion of the character class.

**Create A D&D Character:**
The creation of a D&D Character will be the main focus of the who application however it is also a feature in itself. As you go through the application you will be writing to a csv file, retrieving from api's and gaining user input

**Delete A D&D Character:**
As you can have multiple characters created you can also view all charcters and delete each character individually, or delete all characters together.

### Outline

Character Creation Flowchart
![CharacterCreationFlow](/docs/images/CharacterCreationFlow.png "Character Creation Flow")

**The menu you see when you first start the application**
![Menu](/docs/images/InitialMenu.png "Initial Menu")

**Character File After Creation visulisation**
![CharFileIdea](/docs/images/CharacterVisual.png "Character File Visualisation")

**Edit Character Flowchart**
![Edit Character Flow](/docs/images/Edit_Character_Flow.png "Edit Character Flowchart")

**View Character Flowchart**
![View Character Flow](/docs/images/View_character_flow.png "View Character Flowchart")

**Delete Character Flowchart**
![Delete Character Flow](/docs/images/Delete_character_flow.png "View Character Flowchart")

**API Access Flowchart**
![API Access Flow](/docs/images/API_Access_flow.png "API Access Flowchart")

### Implemetation Plan

**Create Starting Menu**
-- 1. Import tty-promt Gem
-- 2. Create a menu using prompt.select
-- 3. Using symbols "(\*)" create a marker for the player to use as a guide for selecting options.

- Can overwrite symbol using the following code:

  ```Ruby
      prompt = TTY::Prompt.new(symbols: {marker: ">"})
  ```

-- 4. Menu will include the following options:

- 1.Create Character

- 2. View Character/s

- 3. Edit Character/s

- 4. Delete Character/s

- 5. Exit

#### **CREATE CHARACTER:**

**Character folder and CSV creation:**

1. Check for an existing Character Folder
2. If none exists create Folder structure

   - /src/characters

3.elsif we have the folder structure ask for character name?

```Ruby
    charName = gets.chomp
```

4.Using the charName create the csv file.

e.g TheScaleyMagus.CSV

5.Creation of Folder and is complete we need to now add the character data.

6.Next we are presented with a list of character Races from the ["D&D API"](https://www.dnd5eapi.co/api/races), once the user has selected a Race from the presented options the user is shown a bit of background information about that race.

<!-- This information will eventually be stored, if time is permitted i will give the user the option to read the information and go back to the Race menu and choose a different Race. -->

<!-- IF YOU ARE SEEING THIS THEN THE ABOVE STATEMENT HAS NOT BEEN ADDED -->

7.Next we are presented with a list of character Classes from the ["D&D API"](https://www.dnd5eapi.co/api/classes), once the user has selected a Race from the presented options the user is given a list of items in which the user will eventually have to select two of.

<!-- This information will eventually be stored, if time is permitted i will give the user the option to read the information and go back to the Class menu and choose a different Class. -->

<!-- IF YOU ARE SEEING THIS THEN THE ABOVE STATEMENT HAS NOT BEEN ADDED -->

8.At this point we have completed the character creation process untill I get the ability score and dice rolling mechanics coded into the application.

### Running the application

1. cd in to ./AnthonyMann_T1A3

2. From this folder you run the following in the terminal window.

```Ruby
 ./DND_Character_Bulder.sh

# This command will also install all dependencies required to run.
#For a complete list see below
```

The application will guide you through the creation process.

If for some reason the .sh file does not work please follow these instructions

1. From the folder above ./AnthonyMann_T1A3.

2.Enter the following into your terminal

```Ruby

    gem install bundler
    #  when finished
    bundle install

```

3.cd into src and run the following in the terminal

```Ruby

    ruby main.rb
# This will run the application
```

### Dependencies

csv
faraday
json
pastel
tts
tty-file
tty-font

Thank you for using DND Character Builder
