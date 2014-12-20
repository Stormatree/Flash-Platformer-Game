package com.game{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import com.Base;
	import com.Utils;
	
	public class Hitbox extends Base{
		public var hitLeft:Number;
		public var hitRight:Number;
		public var hitTop:Number;
		public var hitBottom:Number;
		
		public var collided:Boolean; //If collided this tick
		
		public function Hitbox(xy:Point, hitRect:Rectangle){
			super(xy);
			
			//Convert flash rect to hitRight, hitLeft, hitTop, hitBottom hitbox
			hitLeft = hitRect.width - hitRect.x;
			hitRight = hitRect.width - (hitRect.width - hitRect.x);
			
			hitTop = hitRect.height - hitRect.y;
			hitBottom = hitRect.height - (hitRect.height - hitRect.y);
		}
		
		override public function update():void{
			super.update();
			
			collided = false;
		}
		
		//If an X, Y pixel is colliding with this
		public function pointColliding(xPos:Number, yPos:Number){
			if (y - hitTop > yPos)return false;
			if (y + hitBottom < yPos)return false;
			if (x - hitLeft > xPos)return false;
			if (x + hitRight < xPos)return false;
			
			return true;
		}
		
		//If a box is colliding with a box
		public function boxColliding(hitbox:Hitbox):Boolean{
			var collided:Boolean = true;
			
			if (y - hitTop > hitbox.y + hitbox.hitBottom)collided = false;
			if (y + hitBottom < hitbox.y - hitbox.hitTop)collided = false;
			if (x - hitLeft > hitbox.x + hitbox.hitRight)collided = false;
			if (x + hitRight < hitbox.x - hitbox.hitLeft)collided = false;
			
			this.collided = collided;
			return collided;
		}
		
		//If point at the top of the hitbox is colliding
		protected function collidingTop(hitbox:Hitbox):Boolean{
			var collided:Boolean = false;
			
			if (hitbox.pointColliding(x, y - hitTop))collided = true;
			
			this.collided = collided;
			return collided;
		}
		
		//Same as above for the bottom
		protected function collidingBottom(hitbox:Hitbox):Boolean{
			var collided:Boolean = false;
			
			if (hitbox.pointColliding(x, y + hitBottom))collided = true;
			
			this.collided = collided;
			return collided;
		}
		
		//Same as above for the left
		protected function collidingLeft(hitbox:Hitbox):Boolean{
			var collided:Boolean = false;
			
			if (hitbox.pointColliding(x + hitRight, y))collided = true;
			
			this.collided = collided;
			return collided;
		}
		
		//Same as above for the right
		protected function collidingRight(hitbox:Hitbox):Boolean{
			var collided:Boolean = false;
			
			if (hitbox.pointColliding(x - hitRight, y))collided = true;
			
			this.collided = collided;
			return collided;;
		}
		
		//Get the boundry coordinate at which two hitboxes should meet at
		public function boundryX(hitbox:Hitbox):Number{
			if (hitbox.x > x) return x + hitRight + hitbox.hitLeft;
			if (hitbox.x < x) return x - hitLeft - hitbox.hitRight;
			
			return hitbox.x;
		}
		
		//Same as above for the Y axis
		public function boundryY(hitbox:Hitbox):Number{
			if (hitbox.y > y) return y + hitBottom + hitbox.hitTop;
			if (hitbox.y < y) return y - hitTop - hitbox.hitBottom;
			
			return hitbox.x;
		}
		
		//If off of the stage
		protected function outBoundsX():Boolean{
			if(x < 0 - hitRight)return true;
			if(x > stage.stageWidth + hitLeft)return true;
			
			return false;
		}
		protected function outBoundsY():Boolean{
			if(y < 0 - hitBottom)return true;
			if(y > stage.stageHeight + hitTop)return true;
			
			return false;
		}
		
		protected function outBoundsBottom():Boolean{
			if(y > stage.stageHeight + hitTop)return true;
			return false;
		}
	}
}