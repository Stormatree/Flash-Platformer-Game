package com.game{
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import com.Base;
	import com.game.Physbox;
	import com.game.Input;
	import com.game.Projectile;
	import com.Utils;
	import com.game.Spawner;
	
	public class Actor extends Physbox{					
		private var _maxJump:Number = -7;
		private var _acceleration:Number = .5;
				
		public var health = 30;
		
		protected var hurtCooldown = 60; // Frames until can get hurt
		protected var lastHurt = 0; // Counter at last hurt
		
		public var dir = -1; // Sprite direction
		
		public var immobile = false; // Can't be influenced until grounded
		
		public function Actor(xy:Point, hitRect:Rectangle, friction:Number = .85, bounciness:Number = 0){
			super(xy, hitRect, friction, bounciness);
		}
		
		// Pushes the actor on the -y axis
		protected function jump():void{
			if (grounded){
				velocityY = _maxJump;
				grounded = false;
			}
		}
		
		// Slides the actor on +x axes
		protected function right():void{
			if (!falling){
				velocityX += _acceleration;
				dir = -1;
			}
		}
		
		// Slides the actor on -x axes
		protected function left():void{
			if (!falling){
				velocityX -= _acceleration;
				dir = 1;
			}
		}
		
		protected function flipped():int{
			return dir;
		}
		
		// Spawn bullet at x, y in the direction of the player
		protected function shoot():void{			
			Spawner.spawnEnemyBullet(stage, x, y, Spawner.player.x, Spawner.player.y);
		}
		
		// Impulse the actor backwards and damage health
		public function hurt(entity:Base, amount:int = 1):Boolean{
			if (Main.counter > lastHurt + hurtCooldown){
				health -= amount;
				falling = true;
				
				impulseY(-4);
				if (x > entity.x)impulseX(3.5);
				if (x < entity.x)impulseX(-3.5);
				
				lastHurt = Main.counter;
				return true;
			}
			
			return false;
		}
	}
}