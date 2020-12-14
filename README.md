# T1A3 D&D Character Creator

Design and Developed by Anthony Mann

-

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
Access the ["D&D API"](https://www.dnd5eapi.co) to get Multiple streams of information based on where the user is in the character creation process. E.g the first API call is to retrieve a list of **Races**. E.g Druid, Tiefling, Human etc.
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

- TheScaleyMagus.CSV

  5.Creation of Folder and is complete we need to now add the character data.
