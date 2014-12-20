package com.ui{
	import flash.geom.Point;
	import flash.display.Stage;
	import com.game.Input;
	import com.ui.Background;
	import com.ui.Text;
	import com.ui.DigitGroup;
	import com.game.Spawner;
	import com.Base;
	import flash.events.Event;
	
	public class Restart extends Base {
		private var background:Background = new Background(0, 0);
		
		private var died:Text = new Text(0, 0, Text.YOU_DIED);
		private var scoreTxt:Text = new Text(0, 0, Text.YOU_SCORED);
		private var highscoreTxt:Text = new Text(0, 0, Text.HIGH_SCORE);
		private var newHighscore:Text = new Text(0, 0, Text.NEW_HIGHSCORE);
		private var restart:Text = new Text(0, 0, Text.RESTART_OVER);
		
		private var score:DigitGroup = new DigitGroup(0, 0, 0);
		private var highscore:DigitGroup = new DigitGroup(0, 0, 0);
		
		private var selectPressed:Boolean;
		
		private var newHighScore:Boolean;
		
		public function Restart():void{
			var xy:Point = new Point(0, 0);
			
			super(xy);
		}
		
		override public function update():void{			
			if (!Input.keyIsSelect){
				selectPressed = false;
			}else if (Input.keyIsSelect && !selectPressed){
				Main.currentState = Main.PLAYING;
			}
		}
		
		override protected function added(e:Event):void{
			// Reset and add all UI elements
			
			selectPressed = true;
			newHighScore = false;
			
			
			// Various positions tweaks of text
			
			scoreTxt.x = stage.stageWidth / 2 - 20;
			scoreTxt.y = 120;
			
			score.setNumber(Main.score);
			score.x = stage.stageWidth / 2 + 30;
			score.y = 120 - 4;
			
			highscoreTxt.x = stage.stageWidth / 2 - 20;
			highscoreTxt.y = 140;
			
			highscore.setNumber(Main.highscore);
			highscore.x = stage.stageWidth / 2 + 30;
			highscore.y = 140 - 3;
			
			newHighscore.x = stage.stageWidth / 2;
			newHighscore.y = 140;
			
			died.x = stage.stageWidth / 2;
			died.y = 55;
			
			restart.x = stage.stageWidth / 2;
			restart.y = 180;
			
			addChild(background);

			addChild(restart);
			addChild(score);
			addChild(died);
			addChild(scoreTxt);
			
			// Check what texts to add to the stage depending on score and highscore
			
			if (Main.score > Main.highscore){
				addChild(newHighscore);
				newHighScore = true;
				highscore.setNumber(Main.score);
			}else{
				addChild(highscore);
				addChild(highscoreTxt);
			}
		}
		
		override protected function removed(e:Event):void{
			// Remove UI elements
			
			removeChild(background);
			removeChild(scoreTxt);
			removeChild(restart);
			removeChild(score);
			
			// Check to make sure what UI elements were added before removing
			if (newHighScore){
				removeChild(newHighscore);
			}else{
				removeChild(highscore);
				removeChild(highscoreTxt);
			}
		
		}
	}
}