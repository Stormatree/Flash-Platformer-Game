package com.game.ents{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import com.game.Brush;
	
	public class LightBlock extends Brush{
		public static var WIDTH = 16;
		public static var HEIGHT = 16;
		
		public function LightBlock(xPos:int, yPos:int){
			var xy:Point = new Point(xPos, yPos);			
			var hitRect:Rectangle = new Rectangle(8, 8, WIDTH, HEIGHT);
			
			super(xy, hitRect);
		}
	}
}