package com.ui{
	import flash.geom.Point;
	import com.game.Spawner;
	import com.Base;
	import flash.events.Event;
	
	public class Text extends Base{
		public static var RESTART:String = "restart";
		public static var UNPAUSE:String = "unpause";
		public static var YOU_SCORED:String = "you_scored";
		public static var PRESS_SELECT:String = "press_select";
		public static var NEW_HIGHSCORE:String = "new_highscore";
		public static var INSERT_COIN:String = "insert_coin";
		public static var HIGH_SCORE:String = "high_score";
		public static var RESTART_OVER:String = "restart_over";
		public static var UNPAUSE_OVER:String = "unpause_over";
		public static var YOU_DIED:String = "you_died";
		
		public var health:int = 0;
		
		public function Text(xPos:Number, yPos:Number, flag:String){
			var xy:Point = new Point(xPos, yPos);
			
			gotoAndStop(flag);
			
			super(xy);
		}
		
		public function setText(flag:String):void{
			gotoAndStop(flag);
		}
	}
}