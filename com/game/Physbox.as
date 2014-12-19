package com.game{
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import com.game.Hitbox;
	import com.game.Brush;
	import com.game.Map;
	import com.Utils;
	
	public class Physbox extends Hitbox{	
		protected var gravity:Number = .65;
		protected var maxFall:Number = 50;
		protected var friction:Number;
		protected var bounciness:Number;
		
		protected var grounded:Boolean = false; //If on the floor
		protected var falling:Boolean = false; //For disabling friction in-air
		
		protected var velocityX:Number = 0;
		protected var velocityY:Number = 0;
		
		protected var pushX:Number = 0; // Will bypass physics calculations, and apply directly to velocity
		protected var pushY:Number = 0; // Used for being impulsed
		
		public var frozen:Boolean = false; // Won't move
		
		public function Physbox(xy:Point, hitRect:Rectangle, friction:Number = .85, bounciness:Number = .85){			
			super(xy, hitRect);
			
			this.gravity = gravity;
			this.friction = friction;
			this.bounciness = bounciness;
			this.maxFall = maxFall;
		}
		
		override public function update():void{
			super.update();
			
			if (!frozen){
				//Calculating velocity
				if (grounded){
					falling = false;
				}
				
				if (velocityY != 0){
					grounded = false;
				}
				
				if (!falling)velocityX = Utils.clamp(velocityX * friction, -maxFall, maxFall);
				velocityY = Utils.clamp(velocityY + gravity, -maxFall, maxFall);
				
				if (Math.abs(velocityX) < .075){
					velocityX = 0;
				}
				
				if (pushX != 0){
					velocityX = pushX;
					pushX = 0;
				}
				
				if (pushY != 0){
					velocityY = pushY;
					pushY = 0;
				}
				
				// Apllying velocity, and then collision
				
				x += velocityX;
				y += velocityY;
				
				collision();
			}
		}
		
		protected function collision():void{
			
			// If touching a brush entity on the top, bottom, left, or right of this
			// and changing physics values depending on the collision.
			for each (var brush:Brush in Map.brushes){
				if (collidingTop(brush)){
					y = brush.boundryY(this);
					velocityY *= -1;
					velocityY *= bounciness;
					if (Math.abs(velocityY) < 2)velocityY = 0;
					
				}else if (collidingBottom(brush)){
					y = brush.boundryY(this);
					velocityY *= -1;
					velocityY *= bounciness;
					grounded = true;
					if (Math.abs(velocityY) < 2)velocityY = 0;
			
				}else if (collidingLeft(brush)){
					x = brush.boundryX(this);
					velocityX *= -1;
					velocityX *= bounciness;
					if (Math.abs(velocityX) < 2)velocityX = 0;
					
				}else if (collidingRight(brush)){
					x = brush.boundryX(this);
					velocityX *= -1;
					velocityX *= bounciness;
					if (Math.abs(velocityX) < 2)velocityX = 0;
					
				}
			}
		}
		
		public function impulseX(velocityx:Number){
			grounded = false;
			pushX += velocityx;
		}
		
		public function impulseY(velocity:Number){
			pushY += velocity;

			if (pushY < 0){
				grounded = false;
			}
		}
		
		public function impulse(angle:Number, velocity:Number){
			pushY += Math.cos(angle) * velocity;
			pushX += Math.sin(angle) * velocity;
			
			if (pushY < 0){
				grounded = false;
			}
		}
	}
}