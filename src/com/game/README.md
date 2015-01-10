Controller Classes:

Map	- Handles brushes, and parralax scrolling

Input	- Handles keyboard input

Spawner	- Handles physboxes, projectiles, actors, and player

Game Classes:

			Base ------------.
		         |            \
		      Hitbox -----.   Parallax
		      /    \       \
	        Physbox    Brush   Projectile
	        /
	     Actor
	    /   \
	Player  Enemy

Base	 - (x, y)
Used in anything on the stage

Hitbox   - (HitRectangle)
Handles collision

Physbox  - (Friction, Bounce)
Handles physics

Actor    - (Acceleration, Jump)
Handles movement

Player   - (pushX, pushY)
Handles animation and controls

Enemy 	 - (LeapChance, Firerate)
Handles cheap AI

Projectile (Faction, Direction)
Spawns and moves in a constant direction

Brush
Used for anything solid in the map

Parralax (Speed, Friction)
Used for the cloud background effect
