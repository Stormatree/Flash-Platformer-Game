package com.ui{
	import com.ui.Digit;
	import com.Base;
	import flash.events.Event;
	import flash.geom.Point;
	
	public class DigitGroup extends Base {
		private var digits:Vector.<Digit> = new Vector.<Digit>();
		
		public function DigitGroup(xPos:Number, yPos:Number, number:int):void{
			var xy:Point = new Point(xPos, yPos);
			
			super(xy);
			
			digits = new Vector.<Digit>();
			
			setNumber(number);
		}
		
		public function setNumber(number:int):void{			
			var numberStr:String = number.toString();
			
			var i:int;
			
			for (i = digits.length - 1; i >= 0; i--){
				removeChild(digits[i]);
				digits[i] = null;
				digits.splice(i, 1);
			}
			
			for (i = numberStr.length - 1; i >= 0; i--){
				var digit:Digit = new Digit(Math.abs(i) * 8, 0, int(numberStr.charAt(i)));
				
				digits.push(digit);
				
				addChild(digit);
			}
		}
	}
}