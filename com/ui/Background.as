package com.ui{
	import flash.geom.Point;
	import com.Base;
	
	public class Background extends Base{		
		public function Background(xPos:int, yPos:int){
			var xy:Point = new Point(xPos, yPos);
			
			super(xy);
		}
	}
}