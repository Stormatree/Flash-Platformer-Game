package com.game.ents{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import com.game.Brush;
	
	public class Platform extends Brush{
		public static var WIDTH = 40;
		public static var HEIGHT = 16;
		
		public function Platform(xPos:int, yPos:int){
			var xy:Point = new Point(xPos, yPos);			
			var hitRect:Rectangle = new Rectangle(20, 8, WIDTH, HEIGHT);
			
			super(xy, hitRect);
		}
	}
}