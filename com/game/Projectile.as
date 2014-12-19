package com.game{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import com.game.Hitbox;
	import com.Utils;
	
	public class Projectile extends Hitbox{
		public static var ENEMY:int = 0; // Static used for external comparisons
		public static var PLAYER:int = 1;
		
		public var faction:int; // Used to check if the enemy or player fired this bullet
		
		protected var velocityX:Number = 0;
		protected var velocityY:Number = 0;
		protected var speed:Number = 0;
		public var dir:int;
	
		public function Projectile(xy:Point, hitRect:Rectangle, dir:int, speed:Number, faction:int){		
			super(xy, hitRect);
			
			this.dir = dir;
			this.faction = faction;
			this.speed = speed;
		}
		
		//Apply velocity
		override public function update():void{
			super.update();
			
			x += speed * velocityX;
			y += speed * velocityY;

			collision();
		}
		
		// Destroy this when out of bounds
		protected function collision():void{
			if (outBoundsX() || outBoundsY()){
				destroy = true;
			}
		}
	}
}