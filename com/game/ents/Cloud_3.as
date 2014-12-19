package com.game.ents{
	import flash.geom.Point;
	import com.game.Parallax;
	
	public class Cloud_3 extends Parallax{
		public static var WIDTH = 143 - 1;
		
		speed:Number;
		friction:Number;
		
		public function Cloud_3(xPos:int, yPos:int, speed:Number, friction:Number){			
			var xy:Point = new Point(xPos, yPos);
			super(xy, speed, friction);
		}
	}
}