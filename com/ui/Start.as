package com.ui{
	import flash.geom.Point;
	import flash.display.Stage;
	import com.game.Input;
	import com.ui.Background;
	import com.Base;
	import flash.events.Event;
	
	public class Start extends Base {
		// UI elements
		private var background:Background = new Background(0, 0);
		private var text:Text = new Text(0, 0, Text.PRESS_SELECT);
		
		public function Start():void{
			var xy:Point = new Point(0, 0);			
			super(xy);
			
		}
		
		override public function update():void{
			// Detect is select was pressed, and start playing
			if (Input.keyIsSelect){
				Main.currentState = Main.PLAYING;
			}
		}
		
		override protected function added(e:Event):void{
			//Position setup for text and adding to stage
			
			text.x = stage.stageWidth / 2;
			text.y = stage.stageHeight / 2 + 3;
			
			addChild(background);
			addChild(text);
		}
		
		override protected function removed(e:Event):void{
			// Removing UI elements from stage
			removeChild(background);
			removeChild(text);
		}
	}
}