package com.game
{
	import flash.events.Event;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
		
	public class Input{
		public const KCODE_UP:int = 38; // ArrowUp
		public const KCODE_DOWN:int = 40; // ArrowDown
		public const KCODE_LEFT:int = 37; // ArrowLeft
		public const KCODE_RIGHT:int = 39; // ArrowRight
		public const KCODE_JUMP:int = 90; // Z
		public const KCODE_SHOOT:int = 88; // X
		public const KCODE_SELECT:int = 32; // SpaceBar
		public const KCODE_ESC:int = 27; // Escape
		
		public static var keyIsUp:Boolean = false;
		public static var keyIsDown:Boolean = false;
		public static var keyIsLeft:Boolean = false;
		public static var keyIsRight:Boolean = false;
		public static var keyIsJump:Boolean = false;
		public static var keyIsShoot:Boolean = false;
		public static var keyIsEsc:Boolean = false;
		public static var keyIsSelect:Boolean = false;
		
		public function Input(stage:Stage){
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			stage.addEventListener(Event.DEACTIVATE, outFocus);
		}
		
		private function outFocus(e:Event):void{
			// Stops keys from sticking down when losing focus.
			
			keyIsUp = false;
			keyIsDown = false;
			keyIsLeft = false;
			keyIsRight = false;
			keyIsJump = false;
			keyIsShoot = false;
			keyIsEsc = false;
			keyIsSelect = false;
		}
		
		private function keyDownHandler(e:KeyboardEvent):void{
			// Check what key was pressed
			
			switch(e.keyCode){
				case KCODE_UP:
					keyIsUp = true;
					break;
				case KCODE_DOWN:
					keyIsDown = true;
					break;
				case KCODE_LEFT:
					keyIsLeft = true;
					break;
				case KCODE_RIGHT:
					keyIsRight = true;
					break;
				case KCODE_JUMP:
					keyIsJump = true;
					break;
				case KCODE_SHOOT:
					keyIsShoot = true;
					break;
				case KCODE_SELECT:
					keyIsSelect = true;
					break;
				case KCODE_ESC:
					keyIsEsc = true;
					break;
			}
		}
		private function keyUpHandler(e:KeyboardEvent):void{
			//Check what key is lifted
			
			switch(e.keyCode){
				case KCODE_UP:
					keyIsUp = false;
					break;
				case KCODE_DOWN:
					keyIsDown = false;
					break;
				case KCODE_LEFT:
					keyIsLeft = false;
					break;
				case KCODE_RIGHT:
					keyIsRight = false;
					break;
				case KCODE_JUMP:
					keyIsJump = false;
					break;
				case KCODE_SHOOT:
					keyIsShoot = false;
					break;
				case KCODE_SELECT:
					keyIsSelect = false;
					break;
				case KCODE_ESC:
					keyIsEsc = false;
					break;
			}
		}
	}
}