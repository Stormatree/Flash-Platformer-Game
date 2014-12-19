package com.ui{
	import flash.geom.Point;
	import flash.display.Stage;
	import com.ui.Text;
	import com.game.Input;
	import com.ui.Background;
	import com.Base;
	import flash.events.Event;
	import com.Utils;
	
	public class Paused extends Base {
		
		// All the UI elements :
		
		private var background:Background = new Background(0, 0);
		
		private var unpause:Text = new Text(0, 0, Text.UNPAUSE);
		private var restart:Text = new Text(0, 0, Text.RESTART);
		
		private var highscoreTxt:Text = new Text(0, 0, Text.HIGH_SCORE);
		private var score:DigitGroup = new DigitGroup(5, 5, 0);
		private var highscore:DigitGroup = new DigitGroup(0, 0, 0);
		
		private var escPressed:Boolean;
		private var selectPressed:Boolean;
		private var upPressed:Boolean;
		private var downPressed:Boolean;
		
		// The current button the player is over
		private var option:int = 0;
		
		public function Paused():void{
			var xy:Point = new Point(0, 0);
			
			super(xy);
		}
		
		override public function update():void{
			// Update the score number
			score.setNumber(Main.score);
			
			// Making sure esc wasn't still pressed from previous state
			if (!Input.keyIsEsc){
				escPressed = false;
			}else if (Input.keyIsEsc && !escPressed){ // If not return to state playing
				Main.currentState = Main.PLAYING;
			}
			
			// Change the option depending on the arrow keys
			if (!Input.keyIsUp){
				upPressed = false;
			}else if (Input.keyIsUp && !upPressed){
				option = Utils.clamp(option - 1, 0, 1);
			}
			if (!Input.keyIsDown){
				downPressed = false;
			}else if (Input.keyIsDown && !downPressed){
				option = Utils.clamp(option + 1, 0, 1);
			}
			
			// Change to the hover over version of the button
			if (option == 0){
				restart.setText(Text.RESTART);
				unpause.setText(Text.UNPAUSE_OVER);
			}
			if (option == 1){
				unpause.setText(Text.UNPAUSE);
				restart.setText(Text.RESTART_OVER);
			}
			
			// Make sure select wasn't still pressed from previous state
			if (!Input.keyIsSelect){
				selectPressed = false;
			}else if (Input.keyIsSelect && !selectPressed){ //Execute current option, and change the state
				if (option == 0){
					Main.currentState = Main.PLAYING;
				}else{
					Main.currentState = Main.SILENT_RESTART;
				}
			}
		}
		
		override protected function added(e:Event):void{
			//Reset and add all UI elements
			//(X, Y variables defined here to get stage reference)
			
			selectPressed = true;
			upPressed = true;
			downPressed = true;
			escPressed = true;
			
			highscoreTxt.x = 45;
			highscoreTxt.y = stage.stageHeight - 8;
			
			highscore.setNumber(Main.highscore);
			highscore.x = 90;
			highscore.y = stage.stageHeight - 12;
			
			unpause.x = stage.stageWidth / 2;
			unpause.y = 105;
			
			restart.x = stage.stageWidth / 2;
			restart.y = 155;
			
			option = 0;
			
			addChild(background);
			addChild(unpause);
			addChild(restart);
			addChild(score);
			addChild(highscore);
			addChild(highscoreTxt);
		}
		
		override protected function removed(e:Event):void{
			//Remove all UI elements
			
			removeChild(background);
			removeChild(unpause);
			removeChild(restart);
			removeChild(score);
			removeChild(highscore);
			removeChild(highscoreTxt);
		}
	}
}