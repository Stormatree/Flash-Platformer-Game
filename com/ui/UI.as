package com.ui{
	import flash.geom.Point;
	import flash.display.Stage;
	import com.ui.Paused;
	import com.ui.Playing;
	import com.ui.Restart;
	import com.ui.Start;
	import com.Base;
	
	public class UI extends Base {		
		private var paused:Paused;
		private var playing:Playing;
		private var restart:Restart;
		private var start:Start;
				
		private var currentState = "";
		
		// This is what handles what UI to show at what time.
		// It looks at the Main state and acts accordingly		
		
		public function UI():void{
			var xy:Point = new Point(0, 0);
			
			super(xy);
			
			// Preparing all the menu screens
			paused = new Paused();
			playing = new Playing();
			restart = new Restart();
			start = new Start();
		}
		
		override public function update():void{
			// Update current state's menu
			
			setState(Main.currentState);
			
			switch(currentState){
				case Main.PAUSED:
					paused.update();
					break;
				case Main.PLAYING:
					playing.update()
					break;
				case Main.START:
					start.update();
					break;
				case Main.RESTART:
					restart.update();
					break;
			}
		}
		
		public function setState(state:String):void{
			// Remove current state from stage
			// And add new one
			
			if (state != currentState){
				switch(currentState){
					case Main.PAUSED:
						stage.removeChild(paused);
						break;
					case Main.PLAYING:
						stage.removeChild(playing);
						break;
					case Main.START:
						stage.removeChild(start);
						break;
					case Main.RESTART:
						stage.removeChild(restart);
						break;
				}
				switch(state){
					case Main.PAUSED:
						stage.addChild(paused);
						currentState = state;
						break;
					case Main.PLAYING:
						stage.addChild(playing);
						currentState = state;
						break;
					case Main.START:
						stage.addChild(start);
						currentState = state;
						break;
					case Main.RESTART:
						stage.addChild(restart);
						currentState = state;
						break;
				}
			}
		}
	}
}