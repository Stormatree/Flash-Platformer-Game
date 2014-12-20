package com.game.ents{
	import flash.geom.Point;
	import com.Base;
	
	public class GammaFix extends Base{		
		public function GammaFix(xPos:int, yPos:int){
			var xy:Point = new Point(xPos, yPos);			
			
			super(xy);
		}
	}
}