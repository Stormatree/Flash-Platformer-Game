Flash-Platformer-Game
=====================

<img src="http://i.imgur.com/dmPviTZ.gif">

A playable version of this game can be found here : 

http://elliottslingsby.co.uk/cmyk/



Description
=====================

A simple MegaMan 2 style endurance platformer, written in AS3 with Adobe Flash.

The game itself is pretty standard, but the Game Classes inside the com.game folder are quite solid, and most of the game is made from entities in the com.game.ents folder, which are all sub-classes of the game classes.

In theory you could totally reformat the Main.as, Spawner.as, UI.as, and the scripts in com.game.ents to make your own version of this game.

But this isn't really meant to be a template, 
and the above .as files noted above are heavily tied to the current state of com.game.ents.



Requirements
============

Due to the .fla library being a prominent feature of the game's design, a version of Adobe Flash will be needed to compile the game in its current state.

Keep in mind the .fla doesn't contain any actionscript, but the contents of the library contain animations and movieclips that some entities get tied to on compile.
