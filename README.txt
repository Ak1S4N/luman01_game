Hey! Welcome to your idle game!
This "README" file will teach you everything about the files manager and
managing this project if ever you want to add anything for yourself. You can find
anything you need here in the Table of Contents.


-------

**TABLE OF CONTENTS**
1. File Manager
2. Main Scenes
	2,1. Main Menu
	2,2. Main Game / World
		2,2,1. Managers
		2,2,2. Finance Manager
		2,2,3. Character Manager
		2,2,4. Area Manager
		2,2,5. Interior Manager
		2,2,6. Job Manager
		2,2,7. UI Manager
		2,2,8. Shop UI Manager
		2,2,9. Event Manager
	2,3. Objects
3. Resources (Tutorials for creating Jobs, Items, or Events)
	3,1. Jobs
	3,2. Items
	3,3. Events
	3,4. Conditions Met
4. Singletons
	4,1. Game Settings (GameSettings)
	4,2. Save & Load (SaveLoad)
5. FREELANCER'S NOTE.

	------


1. FILE MANAGER
	As you can see from the get-go, the main files in 'res://' consists of 2 folders.
	'assets' and 'new_src'
	
	In the assets folder, it all consists all art and music that is used in the game.
	You might see a folder there with 'Test' on it, that's just a folder made for
	the prototype of the game. There is also 'main' which is self explanatory.
	
	NOTE: If there is any art assets that you want to add to the game yourself,
	you use any folder for that.
	
	the other folder is the 'new_src', which consists all scenes, scripts, resources,
	and all important stuff for the game. That folder consists of sub folder with
	'main_menu' and 'world' being one of the important for the player experience.
	
	The 'Scripts' folder has all the important stuff for the singletons, classes,
	and as well as the 'managers' which governs the main game itself. (Will be tackled
	on 2.2.1, see TABLE OF CONTENTS)

2. Main Menu
	As tackled in the FILE MANAGER (see 1.), there are 2 main scenes in which
	consists of the main player experience. The MAIN SCENE and the MAIN GAME.

2,1. MAIN MENU:
	Pretty self explanatory scene, you can see the scene in 'res://new_src/main_menu'.
	In that folder, it consists the MAIN MENU scene and the script for it.
	
	The scene introduces buttons for NEW GAME, CONTINUE GAME, SETTINGS, and QUIT GAME.
	
	In the NEW GAME, a panel for creating the name of your character will be visible.
	
	In the CONTINUE GAME, a Save & Load singleton will be toggled to make the game
	continue your last saved. (To save the game, see 4,2. Save & Load singleton).
	
	The SETTINGS would have the settings for the volume and fullscreen option.
	
	The QUIT GAME is pretty self explanatory as well.

2,2. MAIN GAME
	You can see the main game in the 'res://new_src/world', where one scene named
	'world.tscn' is the main one. The folder also consists of 3 scripts for the
	Hover display (when choosing an option in events or buying an item in the shop),
	Paused Menu, and the World script itself. Although the World script doesn't have
	much itself, it just consists the function for opening/closing the Paused Menu.
	
	The Game itself has BUILDINGS that the player can interact, in which if they
	did, INTERIORS for whatever BUILDING will be opened.

2,2,1. MANAGERS
	One of the keyhighlights of the world are the MANAGER classes which mainly
	governs all the rules of the game and how they all function all together.
	
	These managers also speak how the game itself is programmed (object oriented
	programming), which means that each MANAGERS have functions for themselves and
	is created that way for better readability.

2,2,2. FINANCE MANAGER
	This MANAGER consists function for income/salary, expenses from shops, and
	the player's wallet itself. If the wallet became 0, the player will be forced
	to have consequences.

2,2,3. CHARACTER MANAGER
	This MANAGER is for storing the player's name, age, inventory, etc. With the age,
	this MANAGER also trigger conditions when they reach a certain age.
	(To know more about conditions, see 3.4. CONDITIONS MET)

2,2,4. AREA MANAGER
	This MANAGER consists of functions for the buttons for each BUILDINGS. This
	MANAGER goes hand-in-hand with the INTERIOR MANAGER.

2,2,5. INTERIOR MANAGER
	This MANAGER consists of functions for opening INTERIORS.

2,2,6. UI MANAGER
	This MANAGER have functions used for displaying player data seen in the 
	CHARACTER MANAGER and FINANCE MANAGER, such as the player's name, age, job
	occupation, wallet, income, expenses, inventory, etc.
	
	It also opens the character status mainly for the display.

2,2,7. SHOP UI MANAGER
	This MANAGER have functions for setting up and displaying the items with
	buttons on them which the player can interact. And if interacted, the item
	will be transfered to the player's inventory (And will be displayed in the
	UI MANAGER).

2,2,8. EVENT MANAGER
	This MANAGER have functions for displaying events in random or in specific time
	frames. This MANAGER (Like the FINANCE MANAGER) uses a TIMER node for randomization.
	You can also edit the parameters of this MANAGER if ever you lower or higher
	the chance of an event coming out.

2,3. OBJECTS
	The OBJECTS can be seen here in the "res://new_src/objects" which consists of
	scenes and scripts for items that would be see on the main game (Objects that
	are instantiated to the game). Such as:
		1. Event Popup (named: event_scene)
		2. Inventory Containers (named: inventory_item)
		3. Job Containers (named: job_list_item)
		4. Shop item Containers (named: shop_list_item)
	
	These OBJECTS are scenes that are instantiated to the game, often for a much
	efficient way to create more contents (events, jobs, items).

3. RESOURCES
	As an object-oriented style of programming, most of the game's contents are
	created through RESOURCES from the JOBS, EVENTS, and ITEMS.
	
	You can check all RESOURCES in the 'res://new_src/resources/'
	In this section, We will also teach you how to create your own JOBS, EVENTS,
	and ITEMS.

3,1. JOBS:
	To create your own JOBS, go to the "res://new_src/resources/jobs/" folder.
	Then, choose a building folder where you want to create that job. (Creating a new
	job could be done anywhere, but putting exactly the folder where you want
	them to be is much better). Right-click that folder and go to:
		Create New -> Resource -> Job (job.gd).
		
		Don't forget to create a name!
	
	Then, edit the job specification the way you wanted it in the inspector side.
	
	After you create the job, go at the JOB MANAGER node in the WORLD scene, go
	to inspector and to the BUILDING where you made the JOB for - into the array.
	
	Then the game will automatically create a JOB LIST for you.

3,2. ITEMS:
	To create your own ITEMS, go to "res://new_src/resources/items/" folder.
	Right-click on that folder and go to:
		Create New -> Resource -> Item (item.gd).
		Don't forget to create a name!
	
	Edit the job specifications the way you wanted it in the inspector side.
	In addition, you can also add requirements to your job by dragging a JOB
	resource file to the "Job Required" section in the Inspector.
	
	After you've created your ITEM, go at the shop_ui (that's the SHOP MANAGER)
	in the WORLD scene. And in the inspector, open the exported array of "Item List",
	and add your ITEM there.

3,3. EVENTS:
	To create your own EVENTS, go to "res://new_src/resources/events/" folder.
	Right-click that folder and go to:
		Create New -> Resource -> Event (event.gd).
		Don't forget to create a name!
	
	Edit the specifications of your event in the inspector side. Don't forget that
	conditions_needed in the inspector side is case sensitive (whether your event's
	conditions are job type or item type), so be VERY VERY SPECIFIC.
	
	Choose the Condition Type in the 'Cond Type Needed' section.
	
	Then, go to the EVENT MANAGER in the WORLD scene, then open the 'Random Gen'
	section in the inspector, and add your event there.

3,4. CONDITIONS MET:
	Conditions is one of the most important aspects of the game for a much
	immersive experience. CONDITIONS MET is a resource that can be found in the
	RESOURCE folder.
	
	All the player's event experiences, current jobs, or inventory items are
	all in the CONDITIONS MET resource. CONDITIONS are used for EVENTS so that
	they won't just generate extremely randomly. (Such as, having a child in the
	age 12).
	
	CONDITIONS MET is used for generating events with CONDITIONS, where EVENTS
	you've created (See 3,3. EVENTS) would search if the player already experienced
	the event.

4. SINGLETONS:
	For the game, 2 s are created for a much wider programming capabilities,
	each with their own functions that are callable anywhere in the game.

4,1. GAME SETTING:
	Game Settings consists of functions for the players to edit the game's
	music, sound effects, or the ratio of the screen (full screen or not).
	
	This singleton also holds the variable if the game is paused or not, or 
	if the player is experiencing an event or not. Both variables is used so
	the game would not just roll forward in critical thinking moments.

4,2. SAVE & LOAD:
	This singleton is pretty self explanatory. It's where the game calls to save
	a specific type of data or not.



------
FREELANCER'S NOTE:
Hey! If you've reached this far, I want to thank you for this wonderful experience
of a game development.

It was a great idea from the get-go, and I had fun creating the game itself.

Hope you've enjoyed the game as well, and maybe even make bucks of money if ever
you'd publish it! *glancing on that Review Button*

Just remember, if you need more help, just call me again!


Game Dev,
Keifer Noblejas.
