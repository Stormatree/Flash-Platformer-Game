package com.ui{
	import com.Base;
	import flash.events.Event;
	import flash.geom.Point;
	
	public class Digit extends Base {		
		public function Digit(xPos:Number, yPos:Number, digit:int):void{
			var xy:Point = new Point(xPos, yPos);
			
			super(xy);
			
			gotoAndStop(digit + 1);
		}
		
		public function setDigit(digit:int):void{
			gotoAndStop(digit + 1);
		}
	}
}