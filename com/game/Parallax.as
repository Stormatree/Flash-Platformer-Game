package com.game{
	import flash.geom.Point;
	import com.Base;
	
	public class Parallax extends Base{
		public var speed:Number; // The speed of the layer
		protected var friction:Number; // 0 - 1 number that gets applied to the speed
		
		public function Parallax(xy:Point, speed:Number, friction:Number){
			this.speed = speed;
			this.friction = friction;
			
			super(xy);
		}
		
		// If completely out of bounds
		public function outBounds():Boolean{
			if(x + width < 0 && speed < 0)return true;
			if(x > stage.stageWidth && speed > 0)return true;
			return false;
		}
		
		// Get the trailing edge of the current layer
		public function getEdge():Number{
			if (speed > 0)return x;
			if (speed < 0)return x + width;
			return 0;
		}
		
		//Push the layer along
		override public function update():void{
			x += speed * friction;
		}
	}
}