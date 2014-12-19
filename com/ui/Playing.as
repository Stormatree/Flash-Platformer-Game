package com.ui{
	import flash.geom.Point;
	import flash.display.Stage;
	import com.game.Input;
	import com.ui.HealthBar;
	import com.Base;
	import flash.events.Event;
	import com.ui.DigitGroup;
	import com.ui.Text;
	
	public class Playing extends Base {
		// UI elements
		
		private var healthBar:HealthBar = new HealthBar(0, 0);
		
		private var score:DigitGroup = new DigitGroup(5, 5, 0);
		
		private var escPressed:Boolean;
		
		public function Playing():void{
			var xy:Point = new Point(0, 0);
			
			super(xy);
		}
		
		override public function update():void{
			// Update healthbar and score
			healthBar.update();
			score.setNumber(Main.score);
			
			// Check if esc is still pressed from previous state
			if (!Input.keyIsEsc){
				escPressed = false;
			}else if (Input.keyIsEsc && !escPressed){ // If not then state becomes pause
				Main.currentState = Main.PAUSED;
			}
		}
		
		override protected function added(e:Event):void{
			//Reset and add to stage
			
			healthBar.x = stage.stageWidth - 5;
			healthBar.y = 5;
			
			score.x = 5;
			score.y = 5;
			score.setNumber(0);
			
			escPressed = true;
			
			addChild(healthBar);
			addChild(score);
		}
		
		override protected function removed(e:Event):void{
			// Remove from stage
			
			removeChild(healthBar);
			removeChild(score);
		}
	}
}