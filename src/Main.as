package  {
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.display.StageQuality;
	import com.game.Input;
	import com.game.Spawner;
	import com.game.Map;
	import com.ui.UI;
	
	public class Main extends MovieClip{
		
		//Various states as static for arguement's sake
		
		public static var PAUSED:String = "paused"; // For pause menu
		public static var PLAYING:String = "playing";// For playing state
		public static var START:String = "start";// For start menu
		public static var RESTART:String = "restart";// For restart menu
		public static var SILENT_RESTART:String = "silent_restart";// For restart without menu
		
		public static var currentState = "start";
		
		public static var counter:int = 0;
		
		public static var score:int = 0;
		public static var highscore:int = 0;
		
		// Master classes
		private var input:Input;
		private var spawner:Spawner;
		private var map:Map;
		private var ui:UI;
		
		public function Main(){
			stage.addEventListener(Event.FRAME_CONSTRUCTED, initialize);
			addEventListener(Event.DEACTIVATE, outFocus);
		}
		
		// Pause when lose focus (Clicking off SWF)
		private function outFocus(e:Event):void{
			if (currentState == Main.PLAYING){
				currentState = Main.PAUSED;
			}
		}
		
		// Setup for the first tick before Update
		private function initialize(e:Event):void{		
			stage.removeEventListener(Event.FRAME_CONSTRUCTED, initialize);
			
			stage.showDefaultContextMenu = false;
			stage.quality = StageQuality.LOW;
			
			input = new Input(stage);
			spawner = new Spawner();
			map = new Map();
			ui = new UI();
			
			Map.build(stage);
			
			Spawner.spawnPlayer(stage, 75, -20);
			
			stage.addChild(ui);
			
			currentState = Main.START;

			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		// The main loop
		private function update(e:Event):void{
			ui.update();
			
			if (currentState == Main.PLAYING){ // If state is Playing
				spawner.update(stage); // Update spawner
				map.update(stage);	   // Update map
				
				// Roll for an enemy spawn
				if (counter > 60 * 15){
					if (counter % 400 == 399){
						var colour:int = Math.round(Math.random() * 100); // Roll between 0 - 100
						
						if (colour > 95){ // 5%
							Spawner.spawnBlack(stage, 60 + (300 - 60) * Math.random(), -20);
						}else if (colour > 75){ // 20%
							Spawner.spawnMagenta(stage, 60 + (300 - 60) * Math.random(), -20);
						}else if (colour > 35){ // 40%
							Spawner.spawnCyan(stage, 60 + (300 - 60) * Math.random(), -20);
						}else{ // 45%
							Spawner.spawnYellow(stage, 60 + (300 - 60) * Math.random(), -20);
						}
					}
				}
				
				// Roll for a drill spawn
				if (counter > 60 * 5){
					// If max drills on stage not reached, spawn drill
					if (Spawner.physboxes.length < counter / 750 && counter % 60 == 0){
						Spawner.spawnDrill(stage, Spawner.player.x + ((Math.random() * 200) - 100), -20);
					}
				}
				
				// Add time stated alive to score
				if (counter % 60 == 9){
					Main.score += 25;
				}
				
				counter++;
				
			}else if (currentState == Main.START){ // If state is Start
				// Only update map in menus (For the parralax background)
				map.update(stage);
				
			}else if (currentState == Main.RESTART || currentState == Main.SILENT_RESTART){ // If state is Restart
				// Perform reset when state = restart
				map.update(stage);
				Main.counter = 0;
				
				// Assign new highscore
				if (Main.score > Main.highscore){
					Main.highscore = Main.score;
				}
				
				Main.score = 0;
				Spawner.Reset(stage);
				
				// Skip menu if silent_restart
				if (currentState == Main.SILENT_RESTART){
					currentState = Main.PLAYING;
				}
			}
		}
	}
}